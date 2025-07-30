-- Use or create vehicleDB
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'vehicleDB')
    CREATE DATABASE vehicleDB;
GO

USE vehicleDB;
GO

-- Check if ProductQty table exists; create dummy if not
IF OBJECT_ID('ProductQty', 'U') IS NULL
BEGIN
    CREATE TABLE ProductQty (
        Year INT,
        Quantity INT
    );

    INSERT INTO ProductQty VALUES 
    (2019, 150),
    (2020, 200),
    (2020, 100),
    (2019, 75);
END
GO

-- View ProductQty table
SELECT * FROM ProductQty;
GO

-- Sub-total using ROLLUP
SELECT Year, SUM(Quantity) AS Total_Prod
FROM ProductQty
GROUP BY ROLLUP(Year);
GO

-- Create SalesList table
IF OBJECT_ID('SalesList', 'U') IS NOT NULL
    DROP TABLE SalesList;
GO

CREATE TABLE SalesList (
    SalesMonth NVARCHAR(20),
    SalesQuartes VARCHAR(5),
    SalesYear SMALLINT,
    SalesTotal MONEY
);
GO

-- Insert values into SalesList
INSERT INTO SalesList(SalesMonth, SalesQuartes, SalesYear, SalesTotal) VALUES 
(N'March','Q1',2019,60),
(N'March','Q1',2020,50),
(N'May','Q2',2019,30),
(N'July','Q3',2020,10),
(N'November','Q4',2019,120),
(N'October','Q4',2019,150),
(N'November','Q4',2019,180),
(N'November','Q4',2020,120),
(N'July','Q3',2019,160),
(N'March','Q1',2020,170);
GO

-- View SalesList table
SELECT * FROM SalesList;
GO

-- Grouping with ROLLUP and dynamic labels
SELECT 
    CASE 
        WHEN GROUPING(SalesQuartes) = 1 AND GROUPING(SalesYear) = 0 THEN 'SubTotal'
        WHEN GROUPING(SalesQuartes) = 1 AND GROUPING(SalesYear) = 1 THEN 'Grand Total'
        ELSE CAST(SalesYear AS VARCHAR(10))
    END AS SalesYear,
    SalesQuartes,
    SUM(SalesTotal) AS SalesTotal
FROM SalesList
GROUP BY ROLLUP(SalesYear, SalesQuartes);
GO

-- Create procedure proced1
IF OBJECT_ID('proced1', 'P') IS NOT NULL
    DROP PROCEDURE proced1;
GO

CREATE PROCEDURE proced1 
    @SalesMonth VARCHAR(20), 
    @SalesTotal MONEY
AS
BEGIN
    SELECT * 
    FROM SalesList 
    WHERE SalesMonth = @SalesMonth 
    AND SalesTotal = @SalesTotal;
END;
GO

-- Execute proced1
EXEC proced1 @SalesMonth = 'March', @SalesTotal = 60.00;
GO

-- Dummy customer table creation for demo (if not exists)
IF OBJECT_ID('customer', 'U') IS NULL
BEGIN
    CREATE TABLE customer (
        cust_id INT PRIMARY KEY,
        cust_name VARCHAR(50),
        cust_email VARCHAR(100)
    );

    INSERT INTO customer VALUES
    (105, 'Lokanya', 'lokanya@example.com'),
    (106, 'John Doe', 'john@example.com');
END
GO

-- Create GetCustomerInfo procedure
IF OBJECT_ID('GetCustomerInfo', 'P') IS NOT NULL
    DROP PROCEDURE GetCustomerInfo;
GO

CREATE PROCEDURE GetCustomerInfo
    @p_cust_id INT
AS
BEGIN
    SELECT * FROM customer WHERE cust_id = @p_cust_id;
END;
GO

-- Execute GetCustomerInfo
EXEC GetCustomerInfo @p_cust_id = 105;
GO
