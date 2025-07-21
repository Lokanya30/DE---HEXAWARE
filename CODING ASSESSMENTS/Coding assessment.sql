USE burger_bash;

-- Total Revenue Generated per Runner

SELECT 
    r.runner_id,
    SUM(CASE WHEN bro.distance LIKE '%km%' 
              THEN CAST(REPLACE(bro.distance, 'km', '') AS FLOAT) * 1.5 -- Assume €1.5/km
              ELSE CAST(bro.distance AS FLOAT) * 1.5 END) AS revenue
FROM burger_runner_orders bro
JOIN burger_runner r ON bro.runner_id = r.runner_id
WHERE bro.cancellation IS NULL
GROUP BY r.runner_id;

-- Average Delivery Time per Runner (Minutes)

SELECT 
    runner_id,
    AVG(CAST(SUBSTRING(duration, 1, PATINDEX('%[^0-9]%', duration + 'x') - 1) AS INT)) AS avg_delivery_time_minutes
FROM burger_runner_orders
WHERE cancellation IS NULL AND duration IS NOT NULL
GROUP BY runner_id;

--  Most Popular Burger with Exclusions/Extras

SELECT TOP 1
    b.burger_name,
    COUNT(*) AS customized_orders_count
FROM customer_orders co
JOIN burger_names b ON co.burger_id = b.burger_id
WHERE co.exclusions IS NOT NULL OR co.extras IS NOT NULL
GROUP BY b.burger_name
ORDER BY customized_orders_count DESC;

-- Percentage of Cancelled Orders by Cause

SELECT 
    cancellation,
    COUNT(*) AS cancellation_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM burger_runner_orders), 2) AS percentage
FROM burger_runner_orders
WHERE cancellation IS NOT NULL
GROUP BY cancellation;

-- Customer Order Frequency Analysis

SELECT 
    customer_id,
    COUNT(*) AS order_count,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS customer_rank
FROM customer_orders
GROUP BY customer_id;

-- Runner Efficiency by Order Volume & Distance

SELECT 
    bro.runner_id,
    COUNT(bro.order_id) AS completed_orders,
    SUM(CAST(REPLACE(REPLACE(bro.distance, 'km', ''), ' ', '') AS FLOAT)) AS total_distance_km,
    SUM(CAST(REPLACE(REPLACE(bro.distance, 'km', ''), ' ', '') AS FLOAT)) / COUNT(bro.order_id) AS avg_distance_per_order
FROM burger_runner_orders bro
WHERE bro.cancellation IS NULL
GROUP BY bro.runner_id
ORDER BY completed_orders DESC;

-- Minimum Delivery Time (Fastest Order)

SELECT 
    MIN(CAST(SUBSTRING(duration, 1, PATINDEX('%[^0-9]%', duration + 'x') - 1) AS INT)) AS min_delivery_time_minutes
FROM burger_runner_orders
WHERE cancellation IS NULL AND duration IS NOT NULL;

-- Maximum Distance Covered for Successful Deliveries

SELECT 
    MAX(CAST(REPLACE(REPLACE(distance, 'km', ''), ' ', '') AS FLOAT)) AS max_distance_km
FROM burger_runner_orders
WHERE cancellation IS NULL AND distance IS NOT NULL;

-- Runner with Minimum Deliveries (WHERE + Aggregate)

SELECT TOP 1
    runner_id,
    COUNT(order_id) AS deliveries
FROM burger_runner_orders
WHERE cancellation IS NULL
GROUP BY runner_id
ORDER BY deliveries ASC;