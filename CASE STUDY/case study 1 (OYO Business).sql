-- CASE STUDY 1 OYO business

CREATE DATABASE OyoBookings;
GO
USE OyoBookings;
GO

CREATE TABLE Oyo_Sales (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    statuss VARCHAR(50),
    check_in DATE,
    check_out DATE,
    no_of_rooms INT,
    hotel_id INT,
    amount DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    date_of_booking DATE
);
GO

CREATE TABLE Oyo_City (
    hotel_id INT PRIMARY KEY,
    city VARCHAR(100)
);
GO

USE OyoBookings; -- Ensure you are using your database

INSERT INTO Oyo_Sales (booking_id, customer_id, statuss, check_in, check_out, no_of_rooms, hotel_id, amount, discount, date_of_booking) VALUES
(170, 9197, 'Cancelled', '2022-01-14', '2022-01-15', 1, 757, 3137.00, 796.00, '2022-01-01'),
(171, 9197, 'Cancelled', '2022-01-16', '2022-01-17', 1, 757, 3137.00, 663.00, '2022-01-01'),
(583, 11659, 'Stayed', '2022-01-01', '2022-01-02', 2, 16, 6237.00, 1320.00, '2022-01-01'),
(642, 14499, 'Cancelled', '2022-01-16', '2022-01-18', 10, 346, 59254.00, 12535.00, '2022-01-01'),
(569, 15037, 'No Show', '2022-01-02', '2022-01-03', 1, 207, 1884.00, 398.00, '2022-01-01'),
(882, 22257, 'Cancelled', '2022-01-01', '2022-01-02', 1, 800, 3444.00, 875.00, '2022-01-01'),
(419, 29124, 'Cancelled', '2022-01-02', '2022-01-03', 1, 380, 2144.00, 453.00, '2022-01-01'),
(436, 33021, 'No Show', '2022-01-01', '2022-01-02', 1, 62, 2252.00, 476.00, '2022-01-01'),
(889, 65208, 'Stayed', '2022-01-01', '2022-01-02', 1, 117, 5589.00, 1419.00, '2022-01-01'),
(17, 66762, 'Stayed', '2022-01-07', '2022-01-08', 1, 109, 3509.00, 743.00, '2022-01-01'),
(153, 77179, 'Stayed', '2022-01-02', '2022-01-06', 1, 106, 11887.00, 2515.00, '2022-01-01'),
(545, 81709, 'Cancelled', '2022-01-02', '2022-01-03', 1, 449, 2192.00, 464.00, '2022-01-01'),
(416, 86098, 'Stayed', '2022-01-01', '2022-01-02', 1, 579, 2599.00, 550.00, '2022-01-01'),
(641, 86311, 'Stayed', '2022-01-01', '2022-01-02', 1, 346, 3199.00, 677.00, '2022-01-01'),
(491, 102430, 'Cancelled', '2022-01-02', '2022-01-03', 1, 3, 2469.00, 523.00, '2022-01-01'),
(149, 112913, 'Stayed', '2022-01-29', '2022-02-02', 1, 409, 26255.00, 5554.00, '2022-01-01'),
(799, 118118, 'Stayed', '2022-01-01', '2022-01-02', 1, 689, 4224.00, 893.00, '2022-01-01'),
(445, 145486, 'No Show', '2022-01-03', '2022-01-04', 1, 378, 4939.00, 1045.00, '2022-01-01'),
(798, 159297, 'Cancelled', '2022-01-09', '2022-01-13', 1, 164, 14815.00, 3134.00, '2022-01-01'),
(895, 166300, 'Stayed', '2022-01-01', '2022-01-02', 1, 501, 5004.00, 1058.00, '2022-01-01'),
(731, 168983, 'Cancelled', '2022-01-01', '2022-01-02', 1, 417, 2201.00, 465.00, '2022-01-01'),
(856, 169224, 'Cancelled', '2022-01-08', '2022-01-09', 1, 136, 5654.00, 1436.00, '2022-01-01'),
(568, 182041, 'No Show', '2022-01-02', '2022-01-03', 1, 207, 1884.00, 398.00, '2022-01-01'),
(283, 184360, 'Cancelled', '2022-01-02', '2022-01-03', 1, 473, 2989.00, 759.00, '2022-01-01'),
(519, 189769, 'Stayed', '2022-01-01', '2022-01-02', 1, 420, 2469.00, 523.00, '2022-01-01'),
(570, 196020, 'Cancelled', '2022-01-01', '2022-01-02', 1, 207, 2339.00, 495.00, '2022-01-01'),
(624, 1864, 'Stayed', '2022-01-02', '2022-01-03', 1, 653, 2534.00, 536.00, '2022-01-02'),
(738, 26536, 'Stayed', '2022-01-09', '2022-01-13', 1, 365, 6235.00, 0.00, '2022-01-02'),
(808, 38803, 'Stayed', '2022-01-05', '2022-01-06', 1, 628, 2597.00, 550.00, '2022-01-02'),
(859, 44047, 'Stayed', '2022-01-03', '2022-01-07', 1, 804, 17155.00, 3629.00, '2022-01-02'),
(516, 44356, 'Stayed', '2022-01-02', '2022-01-03', 1, 33, 2079.00, 440.00, '2022-01-02'),
(657, 45644, 'Stayed', '2022-01-02', '2022-01-04', 1, 50, 4807.00, 1018.00, '2022-01-02'),
(977, 56694, 'Cancelled', '2022-01-02', '2022-01-03', 1, 777, 2794.00, 591.00, '2022-01-02'),
(786, 57879, 'Cancelled', '2022-01-03', '2022-01-04', 1, 808, 2794.00, 710.00, '2022-01-02'),
(83, 68240, 'Stayed', '2022-01-02', '2022-01-03', 1, 245, 2005.00, 425.00, '2022-01-02'),
(312, 88939, 'Stayed', '2022-01-02', '2022-01-03', 1, 570, 3769.00, 798.00, '2022-01-02'),
(314, 88939, 'Stayed', '2022-01-03', '2022-01-04', 1, 570, 3509.00, 891.00, '2022-01-02'),
(704, 106977, 'Cancelled', '2022-01-04', '2022-01-05', 1, 58, 2534.00, 644.00, '2022-01-02'),
(109, 108129, 'Stayed', '2022-01-02', '2022-01-03', 1, 938, 2469.00, 523.00, '2022-01-02'),
(846, 120340, 'Stayed', '2022-01-03', '2022-01-04', 1, 330, 6824.00, 1502.00, '2022-01-02'),
(31, 120371, 'Stayed', '2022-01-02', '2022-01-03', 1, 755, 3184.00, 809.00, '2022-01-02'),
(809, 121394, 'Stayed', '2022-01-03', '2022-01-05', 1, 628, 3726.00, 789.00, '2022-01-02'),
(379, 124801, 'Cancelled', '2022-01-02', '2022-01-03', 1, 716, 3379.00, 858.00, '2022-01-02'),
(434, 126821, 'Stayed', '2022-01-03', '2022-01-04', 2, 62, 5327.00, 1352.00, '2022-01-02'),
(435, 126821, 'Stayed', '2022-01-03', '2022-01-04', 1, 62, 2664.00, 677.00, '2022-01-02'),
(391, 130118, 'No Show', '2022-01-15', '2022-01-16', 1, 147, 4029.00, 853.00, '2022-01-02'),
(433, 136431, 'Stayed', '2022-01-02', '2022-01-03', 1, 62, 2794.00, 591.00, '2022-01-02'),
(41, 145504, 'Stayed', '2022-01-03', '2022-01-05', 1, 232, 3510.00, 891.00, '2022-01-02'),
(763, 150171, 'Cancelled', '2022-01-02', '2022-01-03', 1, 655, 3509.00, 743.00, '2022-01-02'),
(18, 161206, 'Stayed', '2022-01-03', '2022-01-04', 1, 109, 2859.00, 605.00, '2022-01-02'),
(418, 161755, 'Cancelled', '2022-01-02', '2022-01-03', 1, 380, 1949.00, 495.00, '2022-01-02'),
(653, 162890, 'No Show', '2022-01-07', '2022-01-08', 1, 50, 2664.00, 677.00, '2022-01-02');

USE OyoBookings; -- Ensure you are using your database

INSERT INTO Oyo_City (hotel_id, city) VALUES
(3, 'Gurgaon'),
(13, 'Gurgaon'),
(16, 'Gurgaon'),
(21, 'Gurgaon'),
(25, 'Delhi'),
(29, 'Gurgaon'),
(31, 'Delhi'),
(33, 'Gurgaon'),
(37, 'Gurgaon'),
(44, 'Noida'),
(45, 'Delhi'),
(48, 'Delhi'),
(49, 'Delhi'),
(50, 'Gurgaon'),
(56, 'Bangalore'),
(58, 'Gurgaon'),
(59, 'Noida'),
(62, 'Delhi'),
(68, 'Mumbai'),
(69, 'Noida'),
(73, 'Delhi'),
(74, 'Gurgaon'),
(77, 'Gurgaon'),
(81, 'Delhi'),
(83, 'Bangalore'),
(84, 'Bangalore'),
(86, 'Bangalore'),
(88, 'Bangalore'),
(89, 'Delhi'),
(91, 'Delhi'),
(92, 'Delhi'),
(93, 'Delhi'),
(96, 'Mumbai'),
(99, 'Delhi'),
(106, 'Bangalore'),
(107, 'Bangalore'),
(109, 'Bangalore'),
(111, 'Mumbai'),
(114, 'Delhi'),
(116, 'Gurgaon'),
(117, 'Mumbai'),
(123, 'Jaipur'),
(124, 'Jaipur'),
(128, 'Bangalore'),
(129, 'Delhi'),
(130, 'Delhi'),
(131, 'Gurgaon'),
(132, 'Delhi'),
(135, 'Delhi'),
(136, 'Mumbai');

-- 1. Average Room Rates of Different Cities

SELECT
    oc.city,
    AVG(os.amount) AS average_room_rate
FROM
    Oyo_Sales os
JOIN
    Oyo_City oc ON os.hotel_id = oc.hotel_id
GROUP BY
    oc.city
ORDER BY
    average_room_rate DESC;

-- 2. Number of Bookings of Different Cities in Jan, Feb, Mar Months

SELECT
    oc.city,
    DATENAME(month, os.date_of_booking) AS booking_month,
    COUNT(os.booking_id) AS number_of_bookings
FROM
    Oyo_Sales os
JOIN
    Oyo_City oc ON os.hotel_id = oc.hotel_id
WHERE
    DATENAME(month, os.date_of_booking) IN ('January', 'February', 'March')
GROUP BY
    oc.city,
    DATENAME(month, os.date_of_booking)
ORDER BY
    oc.city,
    CASE
        WHEN DATENAME(month, os.date_of_booking) = 'January' THEN 1
        WHEN DATENAME(month, os.date_of_booking) = 'February' THEN 2
        WHEN DATENAME(month, os.date_of_booking) = 'March' THEN 3
    END;

-- 3. Frequency of Early Bookings Prior to Check-in the Hotel

SELECT
    DATEDIFF(day, os.date_of_booking, os.check_in) AS days_in_advance,
    COUNT(os.booking_id) AS frequency_of_bookings
FROM
    Oyo_Sales os
GROUP BY
    DATEDIFF(day, os.date_of_booking, os.check_in)
ORDER BY
    days_in_advance;

-- 4. Frequency of Bookings by Number of Rooms in Hotel

SELECT
    os.no_of_rooms,
    COUNT(os.booking_id) AS frequency_of_bookings
FROM
    Oyo_Sales os
GROUP BY
    os.no_of_rooms
ORDER BY
    os.no_of_rooms;

-- 5. New Customers on Jan Month

WITH CustomerFirstBooking AS (
    SELECT
        customer_id,
        MIN(date_of_booking) AS first_booking_date
    FROM
        Oyo_Sales
    GROUP BY
        customer_id
)
SELECT
    COUNT(DISTINCT cfb.customer_id) AS new_customers_in_jan
FROM
    CustomerFirstBooking cfb
WHERE
    DATENAME(month, cfb.first_booking_date) = 'January';

-- 6. Net Revenue to Company (Due to Some Bookings Cancelled)

SELECT
    SUM(CASE WHEN statuss = 'Stayed' THEN amount ELSE 0 END) -
    SUM(CASE WHEN statuss IN ('Cancelled', 'No Show') THEN amount ELSE 0 END) AS net_revenue
FROM
    Oyo_Sales;