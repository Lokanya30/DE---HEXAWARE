-- Create and use the database
CREATE DATABASE pet_adoption;
GO

USE pet_adoption;
GO

-- Create employee table
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
GO

-- Insert sample data into employee table
INSERT INTO employee (id, name, department, salary) VALUES
(1, 'Krish', 'IT', 55000),
(2, 'Nimmi', 'HR', 60000),
(3, 'Aparna', 'Finance', 45000),
(4, 'Jhon', 'IT', 55000),
(5, 'Kiran', 'HR', 40000);
GO

-- View all employee data
SELECT * FROM employee;
GO

-- Create course table
CREATE TABLE course (
    cid INT,
    id INT,
    coursename VARCHAR(20)
);
GO

-- Insert sample data into course table
INSERT INTO course (cid, id, coursename) VALUES
(101, 1, 'SQL'),
(102, 2, 'Python'),
(103, 3, 'Power BI'),
(104, 6, 'Excel'); -- 6 doesn't exist in employee to show outer join effect
GO

-- View all course data
SELECT * FROM course;
GO

-- INNER JOIN
SELECT name, department, cid, coursename
FROM employee
INNER JOIN course ON employee.id = course.id;
GO

-- LEFT OUTER JOIN
SELECT name, department, cid, coursename
FROM employee
LEFT OUTER JOIN course ON employee.id = course.id;
GO

-- RIGHT OUTER JOIN
SELECT name, cid, coursename
FROM employee
RIGHT OUTER JOIN course ON employee.id = course.id;
GO

-- FULL OUTER JOIN
SELECT *
FROM employee
FULL OUTER JOIN course ON employee.id = course.id;
GO

-- NATURAL JOIN simulation using JOIN (since SQL Server doesn't support NATURAL JOIN)
SELECT name, cid, department
FROM employee
JOIN course ON employee.id = course.id;
GO

-- CROSS JOIN
SELECT *
FROM employee
CROSS JOIN course;
GO

-- EQUI JOIN
SELECT *
FROM employee, course
WHERE employee.id = course.id;
GO

-- NON-EQUI JOIN
SELECT *
FROM employee, course
WHERE employee.id >= course.id;
GO

-- SELF JOIN (find employees with same salary as Krish)
SELECT e1.name, e1.id, e1.salary
FROM employee e1, employee e2
WHERE e1.salary = e2.salary AND e2.name = 'Krish';
GO

-- SELF JOIN (same salary as Nimmi)
SELECT e1.name, e1.id, e1.salary
FROM employee e1, employee e2
WHERE e1.salary = e2.salary AND e2.name = 'Nimmi';
GO

-- String Functions
SELECT ASCII('CB'); -- Returns ASCII value of first character
SELECT CHAR(66); -- Returns character for ASCII
SELECT LEN('Microsoft SQL');
SELECT LOWER('JHON');
SELECT REPLACE('Microsoft SQL', 'SQL', 'Server');
SELECT REVERSE('Python');
SELECT UPPER('aparna');
SELECT STR(136.564, 8, 4);
GO

-- Date Functions
SELECT GETDATE();
SELECT DATEADD(MM, 2, '2023-12-07');
SELECT DATEDIFF(YEAR, CONVERT(DATETIME, '2006-05-06'), CONVERT(DATETIME, '2009-01-01'));
SELECT DATEPART(MM, '2008-05-22');
SELECT DAY('2023-05-30');
SELECT MONTH('2023-05-31');
SELECT YEAR('2023-05-03');
GO

-- Mathematical Functions
SELECT ABS(-101);
SELECT SIN(1.5);
SELECT CEILING(14.01);
SELECT EXP(4.5);
SELECT FLOOR(14.75);
SELECT LOG(5.4);
GO

-- Ranking Functions
-- ROW_NUMBER
SELECT id, name, salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS rownumber
FROM employee;
GO

-- RANK
SELECT id, name, salary,
RANK() OVER(ORDER BY salary DESC) AS rank
FROM employee;
GO

-- DENSE_RANK
SELECT id, name, salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS rank
FROM employee;
GO

-- NTILE
SELECT id, name, salary,
NTILE(2) OVER(ORDER BY salary) AS rank
FROM employee;
GO

-- NTILE with condition
SELECT name, salary,
NTILE(3) OVER(ORDER BY salary) AS rank
FROM employee
WHERE salary > 40000;
GO

-- System Functions
SELECT HOST_NAME() AS Host_name;
SELECT HOST_ID();
SELECT SUSER_ID();
SELECT USER_ID();
SELECT DB_NAME();
GO

-- Aggregate Functions
SELECT COUNT(*) AS total_records FROM employee;
SELECT COUNT(*) FROM employee WHERE salary > 30000;
SELECT department, MIN(salary) AS min_salary FROM employee GROUP BY department;
SELECT department, MAX(salary) AS max_salary FROM employee GROUP BY department;
SELECT department, SUM(salary) FROM employee GROUP BY department;
SELECT department, AVG(salary) FROM employee GROUP BY department;
GO
