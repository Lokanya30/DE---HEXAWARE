-- Use or create database
IF DB_ID('pet_adoption') IS NULL
    CREATE DATABASE pet_adoption;
GO

USE pet_adoption;
GO

-- View all user tables
SELECT * FROM sys.tables;
GO

-- Drop table if exists
IF OBJECT_ID('studentdata', 'U') IS NOT NULL
    DROP TABLE studentdata;
GO

-- Create employee table
IF OBJECT_ID('employee', 'U') IS NOT NULL
    DROP TABLE employee;
GO

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    email VARCHAR(20)
);
GO

EXEC sp_help employee;
GO

-- Insert data
INSERT INTO employee VALUES 
(101, 'alex', 30, 'alex@gmail.com'),
(102, 'bob', 20, 'bob@gmail.com'),
(103, 'sunny', 40, 'sunny@gmail.com'),
(104, 'stella', 35, 'stella@gmail.com'),
(105, 'nani', 40, 'nani@gmail.com'),
(106, 'stella', 35, 'stella@gmail.com'),
(107, 'nani', 35, 'nani@gmail.com');
GO

SELECT * FROM employee;
GO

-- Add salary and department columns
ALTER TABLE employee ADD salary INT;
GO

UPDATE employee SET salary = 
    CASE name
        WHEN 'alex' THEN 20000
        WHEN 'bob' THEN 30000
        WHEN 'sunny' THEN 35000
        WHEN 'stella' THEN 35000
        WHEN 'nani' THEN 50000
    END;
GO

ALTER TABLE employee ADD department VARCHAR(20);
GO

UPDATE employee SET department = 
    CASE name
        WHEN 'alex' THEN 'IT'
        WHEN 'bob' THEN 'salesforce'
        WHEN 'sunny' THEN 'HR'
        WHEN 'stella' THEN 'sales'
        WHEN 'nani' THEN 'HR'
    END;
GO

-- Aggregations
SELECT AVG(salary) AS avg_salary FROM employee WHERE department = 'HR';
SELECT COUNT(id) AS count_stella FROM employee WHERE name = 'stella';
SELECT MAX(salary) AS max_salary, department FROM employee GROUP BY department HAVING department = 'HR';
SELECT COUNT(name) AS count_employee, salary FROM employee GROUP BY salary HAVING salary = 50000;
SELECT MAX(salary) AS min_salary, department FROM employee GROUP BY department HAVING department = 'IT';
GO

-- Transactions
BEGIN TRAN;
DELETE FROM employee WHERE age = 20;
COMMIT;

DELETE FROM employee WHERE age = 40;
ROLLBACK;
GO

-- Insert new data
INSERT INTO employee VALUES
(101, 'aparna', 20, 'aparna@gmail.com', 30000, 'sales'),
(102, 'stella', 20, 'stella@gmail.com', 40000, 'HR'),
(104, 'aparna', 20, 'aparna@gmail.com', 30000, 'sales'),
(105, 'stella', 20, 'stella@gmail.com', 40000, 'HR'),
(106, 'kishore', 35, 'kishore@gmail.com', 35000, 'IT'),
(107, 'lucky', 28, 'lucky@gmail.com', 60000, 'salesforce'),
(108, 'nimmi', 30, 'nimmi@gmail.com', 30000, 'IT'),
(109, 'krish', 30, 'krish@gmail.com', 45000, 'sales');
GO

-- Savepoints and rollbacks
BEGIN TRAN;
DELETE FROM employee WHERE id = 102;
SAVE TRANSACTION s1;
ROLLBACK TRANSACTION s1;
GO

BEGIN TRAN;
INSERT INTO employee VALUES (103, 'bob', 45, 'bob@gmail.com', 30000, 'IT');
SAVE TRANSACTION s2;
ROLLBACK TRANSACTION s2;

BEGIN TRANSACTION;
DELETE FROM employee WHERE id = 103;
SAVE TRANSACTION s3;
ROLLBACK TRANSACTION s3;
GO

-- Create second table emp
CREATE TABLE emp (
    id INT,
    name VARCHAR(10),
    age INT,
    email VARCHAR(20),
    salary INT,
    department VARCHAR(10)
);
GO

-- Insert into emp
INSERT INTO emp VALUES
(201, 'bob', 45, 'bob@gmail.com', 30000, 'IT'),
(107, 'lucky', 28, 'lucky@gmail.com', 60000, 'salesforce'),
(108, 'nimmi', 30, 'nimmi@gmail.com', 30000, 'IT'),
(202, 'heshi', 45, 'heshi@gmail.com', 30000, 'HR'),
(203, 'minnu', 45, 'minnu@gmail.com', 30000, 'HR');
GO

-- Set operations
SELECT * FROM employee
UNION
SELECT * FROM emp;

SELECT * FROM employee
UNION ALL
SELECT * FROM emp;

SELECT * FROM employee
INTERSECT
SELECT * FROM emp;

SELECT * FROM emp
EXCEPT
SELECT * FROM employee;

SELECT name, salary, age FROM employee
EXCEPT
SELECT name, salary, age FROM emp;
GO

-- Create customer table
CREATE TABLE customer (
    id INT UNIQUE,
    name VARCHAR(10) NOT NULL,
    state VARCHAR(10)
);
GO

INSERT INTO customer VALUES
(1, 'lucky', 'AP'),
(2, 'kishore', 'AP'),
(3, 'charan', 'UP'),
(4, 'ani', 'Jammu'),
(5, 'Heshi', 'Tamilnadu'),
(6, 'Varsha', 'Kerala'),
(7, 'honey', 'Jammu'),
(8, 'fani', 'Tamilnadu'),
(9, 'priya', 'UP'),
(10, 'mani', 'Karnataka');
GO

ALTER TABLE customer ADD age INT CHECK (age >= 18);
GO

UPDATE customer SET age = 
    CASE id
        WHEN 2 THEN 22
        WHEN 3 THEN 25
        WHEN 4 THEN 22
        WHEN 5 THEN 23
        WHEN 6 THEN 23
        WHEN 7 THEN 20
        WHEN 8 THEN 25
        WHEN 9 THEN 25
        WHEN 10 THEN 22
    END;
GO

-- View customer table
SELECT * FROM customer;
GO

-- Create student and school tables with foreign key
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(10),
    schoolname VARCHAR(20)
);
GO

INSERT INTO student VALUES
(1, 'aaa', 'school1'),
(2, 'bbb', 'school2'),
(3, 'ccc', 'school3'),
(4, 'ddd', 'school4');
GO

CREATE TABLE school (
    branchname VARCHAR(20),
    id INT PRIMARY KEY FOREIGN KEY REFERENCES student(id)
);
GO

INSERT INTO school VALUES
('chennai', 1),
('banglore', 2),
('manglore', 3),
('mumbai', 4);
GO

SELECT * FROM student;
SELECT * FROM school;
GO
