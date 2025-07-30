-- 1. Create Database and Use It
CREATE DATABASE IF NOT EXISTS TestDB;
USE TestDB;

-- 2. Create Tables
CREATE TABLE IF NOT EXISTS Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    DOJ DATE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- 3. Insert Data
INSERT INTO Departments (DeptID, DeptName) VALUES 
(1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID, DOJ) VALUES 
(101, 'Alice', 50000, 1, '2020-01-15'),
(102, 'Bob', 60000, 2, '2021-03-22'),
(103, 'Charlie', 55000, 3, '2019-07-10'),
(104, 'David', 70000, 2, '2022-06-30'),
(105, 'Eva', 62000, 1, '2020-11-01');

-- 4. Update & Delete
UPDATE Employees SET Salary = Salary + 5000 WHERE EmpName = 'Alice' AND EmpID = 101;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Employees WHERE EmpName = 'Charlie';
SET SQL_SAFE_UPDATES = 1;

DELETE FROM Employees WHERE EmpID = 103;


-- 5. Retrieve Data
SELECT * FROM Employees;
SELECT EmpName, Salary FROM Employees WHERE Salary > 60000;
SELECT DISTINCT DeptID FROM Employees;
SELECT EmpName FROM Employees WHERE EmpName LIKE 'A%';
SELECT * FROM Employees WHERE DeptID IN (1, 2) AND Salary BETWEEN 50000 AND 70000;
SELECT EmpName AS Name, Salary AS MonthlySalary FROM Employees;

-- 6. Functions
SELECT EmpName, UPPER(EmpName) AS UpperName FROM Employees;
SELECT EmpName, YEAR(DOJ) AS JoiningYear FROM Employees;
SELECT EmpName, ROUND(Salary * 0.1, 2) AS Bonus FROM Employees;
SELECT EmpName, NOW() AS TodayDate FROM Employees;

-- 7. Aggregation & Grouping
SELECT DeptID, COUNT(*) AS TotalEmployees, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID;

SELECT DeptID, COUNT(*) AS EmpCount
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 1;

-- 8. Joins
-- LEFT JOIN
SELECT e.EmpName, d.DeptName
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID;

-- RIGHT JOIN
SELECT e.EmpName, d.DeptName
FROM Employees e
RIGHT JOIN Departments d ON e.DeptID = d.DeptID;

-- FULL OUTER JOIN (Not directly supported in MySQL)
SELECT e.EmpName, d.DeptName
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID
UNION
SELECT e.EmpName, d.DeptName
FROM Employees e
RIGHT JOIN Departments d ON e.DeptID = d.DeptID;

-- CROSS JOIN
SELECT e.EmpName, d.DeptName
FROM Employees e
CROSS JOIN Departments d;

-- JOIN + GROUP BY
SELECT d.DeptName, COUNT(e.EmpID) AS EmpCount
FROM Departments d
JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName;

-- 9. Subqueries & Set Operators
-- Self Join (Example only)
SELECT e1.EmpName AS Employee, e2.EmpName AS Colleague
FROM Employees e1
JOIN Employees e2 ON e1.DeptID = e2.DeptID AND e1.EmpID != e2.EmpID;


-- TODAY 
-- EXISTS
SELECT EmpName FROM Employees e
WHERE EXISTS (
    SELECT 1 FROM Departments d WHERE d.DeptID = e.DeptID
);

-- ANY / ALL
SELECT * FROM Employees 
WHERE Salary > ALL (SELECT Salary FROM Employees WHERE DeptID = 1);

-- Nested Subquery
SELECT EmpName FROM Employees 
WHERE DeptID = (SELECT DeptID FROM Departments WHERE DeptName = 'IT');

-- Correlated Subquery
SELECT EmpName, Salary FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary) FROM Employees WHERE DeptID = e.DeptID
);

-- UNION
SELECT EmpName AS Name FROM Employees
UNION
SELECT DeptName AS Name FROM Departments;

-- INTERSECT and EXCEPT not supported directly in MySQL, simulate using INNER JOIN and NOT IN

-- INTERSECT simulation
SELECT DISTINCT e.DeptID FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID;

-- EXCEPT simulation
SELECT DeptID FROM Departments 
WHERE DeptID NOT IN (SELECT DeptID FROM Employees);

-- AND 
SELECT * FROM Employees 
WHERE DeptID = 2 AND Salary > 60000;

-- OR
SELECT * FROM Employees 
WHERE DeptID = 1 OR Salary < 60000;

-- NOT
SELECT * FROM Employees 
WHERE NOT (DeptID = 2);

SELECT * FROM Employees
WHERE (DeptID = 1 OR DeptID = 2) AND NOT (Salary < 60000);

-- LIKE
SELECT * FROM Employees 
WHERE EmpName LIKE 'A%';  -- Starts with A

SELECT * FROM Employees 
WHERE EmpName LIKE '%v%';  -- Contains 'v'

SELECT * FROM Employees 
WHERE EmpName LIKE '__b%';  -- 2nd letter is 'b'

-- BETWEEN
SELECT * FROM Employees 
WHERE Salary BETWEEN 55000 AND 65000;

SELECT * FROM Employees 
WHERE DOJ BETWEEN '2020-01-01' AND '2021-12-31';

-- IN
SELECT * FROM Employees 
WHERE DeptID IN (1, 3);

SELECT * FROM Employees 
WHERE EmpName IN ('Alice', 'Bob');

-- EXISTS
SELECT EmpName FROM Employees e
WHERE EXISTS (
    SELECT 1 FROM Departments d WHERE d.DeptID = e.DeptID
);

-- ALL
SELECT * FROM Employees 
WHERE Salary > ALL (
    SELECT Salary FROM Employees WHERE DeptID = 1
);

-- ANY/SOME
SELECT * FROM Employees 
WHERE Salary > ANY (
    SELECT Salary FROM Employees WHERE DeptID = 2
);

-- DISTINCT
SELECT DISTINCT DeptID FROM Employees;
SELECT DISTINCT Salary FROM Employees;
SELECT DISTINCT DeptID, Salary FROM Employees; 

SELECT * FROM Employees;
