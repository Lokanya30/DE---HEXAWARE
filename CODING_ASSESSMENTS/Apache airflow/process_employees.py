from datetime import datetime
from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.decorators import task
from airflow.providers.postgres.hooks.postgres import PostgresHook
import os

# Task to load CSV into Postgres
@task
def get_data():
    data_path = "/opt/airflow/dags/employees.csv"
    if not os.path.exists(data_path):
        raise FileNotFoundError(f"{data_path} not found. Please place employees.csv there.")

    # Load into Postgres
    postgres_hook = PostgresHook(postgres_conn_id="tutorial_pg_conn")
    conn = postgres_hook.get_conn()
    cur = conn.cursor()
    with open(data_path, "r", encoding="utf-8") as file:
        cur.copy_expert("""
            COPY employees_temp FROM STDIN WITH CSV HEADER
            DELIMITER ',' QUOTE '"'
        """, file)
    conn.commit()
    cur.close()
    conn.close()


with DAG(
    dag_id="process_employees_dag",
    start_date=datetime(2023, 1, 1),
    schedule_interval=None,
    catchup=False,
) as dag:

    # Create employees main table
    create_employees_table = PostgresOperator(
        task_id="create_employees_table",
        postgres_conn_id="tutorial_pg_conn",
        sql="""
        CREATE TABLE IF NOT EXISTS employees (
            id INTEGER PRIMARY KEY,
            name TEXT,
            department TEXT
        )
        """,
    )

    # Create employees temp table
    create_employees_temp_table = PostgresOperator(
        task_id="create_employees_temp_table",
        postgres_conn_id="tutorial_pg_conn",
        sql="""
        CREATE TABLE IF NOT EXISTS employees_temp (
            id INTEGER,
            name TEXT,
            department TEXT
        )
        """,
    )

    # Merge data from temp into main table
    merge_data = PostgresOperator(
        task_id="merge_data",
        postgres_conn_id="tutorial_pg_conn",
        sql="""
        INSERT INTO employees (id, name, department)
        SELECT DISTINCT id, name, department
        FROM employees_temp
        ON CONFLICT (id) DO UPDATE 
        SET 
            name = EXCLUDED.name,
            department = EXCLUDED.department;
        """,
    )

    # Run tasks in sequence
    create_employees_table >> create_employees_temp_table >> get_data() >> merge_data
