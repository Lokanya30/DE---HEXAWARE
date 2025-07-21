-- CASE STUDY 2 BURGER BASH

CREATE DATABASE burger_bash;
GO
USE burger_bash;
GO

CREATE TABLE burger_names (
    burger_id INT PRIMARY KEY,
    burger_name VARCHAR(50)
);
GO

CREATE TABLE burger_runner (
    runner_id INT PRIMARY KEY,
    registration_date DATETIME
);
GO

CREATE TABLE burger_runner_orders (
    order_id INT PRIMARY KEY,
    runner_id INT,
    pickup_time DATETIME,
    distance VARCHAR(10),
    duration VARCHAR(10),
    cancellation VARCHAR(50),
    FOREIGN KEY (runner_id) REFERENCES burger_runner(runner_id)
);
GO

CREATE TABLE customer_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    burger_id INT,
    exclusions VARCHAR(50),
    extras VARCHAR(50),
    order_time DATETIME,
    FOREIGN KEY (burger_id) REFERENCES burger_names(burger_id)
);
GO

-- Inserting data into burger_names
INSERT INTO burger_names (burger_id, burger_name) VALUES
(1, 'Meatlovers'),
(2, 'Vegetarian');

-- Inserting data into burger_runner
INSERT INTO burger_runner (runner_id, registration_date) VALUES
(1, '2021-01-01T00:00:00.000Z'),
(2, '2021-01-03T00:00:00.000Z'),
(3, '2021-01-08T00:00:00.000Z'),
(4, '2021-01-15T00:00:00.000Z');

-- Inserting data into burger_runner_orders
INSERT INTO burger_runner_orders (order_id, runner_id, pickup_time, distance, duration, cancellation) VALUES
(1, 1, '2021-01-01 18:15', '20km', '32 minutes', NULL),
(2, 1, '2021-01-01 19:10', '20km', '27 minutes', NULL),
(3, 1, '2021-01-03 00:12', '13.4km', '20 mins', NULL),
(4, 2, '2021-01-04 13:53', '23.4', '40', NULL),
(5, 3, '2021-01-08 21:10', '10', '15', NULL),
(6, 3, NULL, NULL, NULL, 'Restaurant Cancellation'),
(7, 2, '2021-01-08 21:30', '25km', '25mins', NULL),
(8, 2, '2021-01-10 00:15', '23.4 km', '15 minute', NULL),
(9, 2, NULL, NULL, NULL, 'Customer Cancellation'),
(10, 1, '2021-01-11 18:50', '10km', '10minutes', NULL);

-- Inserting data into customer_orders

INSERT INTO customer_orders (order_id, customer_id, burger_id, exclusions, extras, order_time) VALUES
(1, 101, 1, NULL, NULL, '2021-01-01T18:05:02.000Z'),
(2, 101, 1, NULL, NULL, '2021-01-01T19:00:52.000Z'),
(3, 102, 1, NULL, NULL, '2021-01-02T23:51:23.000Z'),
(11, 102, 2, NULL, NULL, '2021-01-02T23:51:23.000Z'), -- Changed order_id to 11
(4, 103, 1, '4', NULL, '2021-01-04T13:23:46.000Z'),
(12, 103, 1, '4', NULL, '2021-01-04T13:23:46.000Z'), -- Changed order_id to 12
(15, 103, 2, '4', NULL, '2021-01-04T13:23:46.000Z'),
(5, 104, 1, NULL, '1', '2021-01-08T21:00:29.000Z'),
(6, 101, 2, NULL, NULL, '2021-01-08T21:03:13.000Z'),
(7, 105, 2, NULL, '1', '2021-01-08T21:20:29.000Z'),
(8, 102, 1, NULL, NULL, '2021-01-09T23:54:33.000Z'),
(9, 103, 1, '4', '1, 5', '2021-01-10T11:22:59.000Z'),
(10, 104, 1, NULL, NULL, '2021-01-11T18:34:49.000Z'),
(13, 104, 1, '2, 6', '1, 4', '2021-01-11T18:34:49.000Z'); -- Changed order_id to 13

-- Question 1: How many burgers were ordered?

SELECT COUNT(*) AS total_burgers_ordered
FROM customer_orders;

-- Question 2: How many unique customer orders were made?

SELECT COUNT(DISTINCT order_id) AS unique_customer_orders
FROM customer_orders;

-- Question 3: How many successful orders were delivered by each runner?

SELECT runner_id, COUNT(order_id) AS successful_orders
FROM burger_runner_orders
WHERE cancellation IS NULL
GROUP BY runner_id;

-- Question 4: How many of each type of burger was delivered?

SELECT b.burger_name, COUNT(co.order_id) AS burgers_delivered
FROM customer_orders co
JOIN burger_names b ON co.burger_id = b.burger_id
GROUP BY b.burger_name;

-- Question 5: How many Vegetarian and Meatlovers were ordered by each customer?

SELECT customer_id, 
       SUM(CASE WHEN burger_id = 1 THEN 1 ELSE 0 END) AS Meatlovers_count,
       SUM(CASE WHEN burger_id = 2 THEN 1 ELSE 0 END) AS Vegetarian_count
FROM customer_orders
GROUP BY customer_id;

-- Question 6: What was the maximum number of burgers delivered in a single order?

SELECT MAX(order_count) AS max_burgers_in_single_order
FROM (
    SELECT order_id, COUNT(burger_id) AS order_count
    FROM customer_orders
    GROUP BY order_id
) AS order_counts;

