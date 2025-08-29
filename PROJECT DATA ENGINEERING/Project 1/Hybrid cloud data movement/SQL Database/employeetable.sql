create database employee
-- Switch to your database
USE cloudproject;
GO

-- Create FreshersDetails table
CREATE TABLE Employee1 (
    FresherID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Gender NVARCHAR(10),
    DOB DATE,
    Email NVARCHAR(150),
    Phone NVARCHAR(20),
    Address NVARCHAR(200),
    Qualification NVARCHAR(100),
    Department NVARCHAR(50),
    JoiningDate DATE
);
GO

-- Insert 20 sample freshers
INSERT INTO Employee1 (FresherID, FullName, Gender, DOB, Email, Phone, Address, Qualification, Department, JoiningDate) VALUES
(1, 'Amit Sharma', 'Male', '2000-02-15', 'amit.sharma@example.com', '9876543210', 'Delhi, India', 'B.Tech CSE', 'IT', '2025-01-10'),
(2, 'Neha Verma', 'Female', '1999-11-25', 'neha.verma@example.com', '9876501234', 'Mumbai, India', 'MBA HR', 'HR', '2025-01-10'),
(3, 'Rahul Mehta', 'Male', '2001-03-12', 'rahul.mehta@example.com', '9876123456', 'Pune, India', 'B.Com', 'Finance', '2025-01-10'),
(4, 'Sneha Iyer', 'Female', '2000-07-08', 'sneha.iyer@example.com', '9876234567', 'Chennai, India', 'B.Sc IT', 'IT', '2025-01-15'),
(5, 'Karthik Reddy', 'Male', '1999-05-20', 'karthik.reddy@example.com', '9876345678', 'Hyderabad, India', 'MCA', 'IT', '2025-01-15'),
(6, 'Priya Nair', 'Female', '2000-09-18', 'priya.nair@example.com', '9876456789', 'Kochi, India', 'MBA Finance', 'Finance', '2025-01-20'),
(7, 'Suresh Kumar', 'Male', '2001-01-05', 'suresh.kumar@example.com', '9876567890', 'Bangalore, India', 'B.Tech ECE', 'IT', '2025-01-20'),
(8, 'Ananya Gupta', 'Female', '2000-04-10', 'ananya.gupta@example.com', '9876678901', 'Jaipur, India', 'BA Economics', 'Finance', '2025-01-25'),
(9, 'Ravi Patel', 'Male', '1999-12-22', 'ravi.patel@example.com', '9876789012', 'Ahmedabad, India', 'MBA Marketing', 'Marketing', '2025-01-25'),
(10, 'Meera Joshi', 'Female', '2001-06-14', 'meera.joshi@example.com', '9876890123', 'Lucknow, India', 'BCA', 'IT', '2025-02-01'),
(11, 'Arjun Desai', 'Male', '2000-08-30', 'arjun.desai@example.com', '9876901234', 'Surat, India', 'B.Sc Physics', 'R&D', '2025-02-01'),
(12, 'Divya Menon', 'Female', '1999-10-09', 'divya.menon@example.com', '9876012345', 'Trivandrum, India', 'MBA HR', 'HR', '2025-02-05'),
(13, 'Varun Singh', 'Male', '2001-02-18', 'varun.singh@example.com', '9876123450', 'Kanpur, India', 'BBA', 'Operations', '2025-02-05'),
(14, 'Ritika Malhotra', 'Female', '2000-03-25', 'ritika.malhotra@example.com', '9876234501', 'Chandigarh, India', 'B.Tech IT', 'IT', '2025-02-10'),
(15, 'Akash Jain', 'Male', '1999-07-12', 'akash.jain@example.com', '9876345012', 'Indore, India', 'MBA Finance', 'Finance', '2025-02-10'),
(16, 'Shreya Kapoor', 'Female', '2000-11-01', 'shreya.kapoor@example.com', '9876450123', 'Delhi, India', 'B.Tech CSE', 'IT', '2025-02-15'),
(17, 'Vikram Chauhan', 'Male', '2001-09-22', 'vikram.chauhan@example.com', '9876567891', 'Noida, India', 'B.Sc Math', 'Analytics', '2025-02-15'),
(18, 'Pooja Rathi', 'Female', '1999-05-19', 'pooja.rathi@example.com', '9876678902', 'Nagpur, India', 'MBA Marketing', 'Marketing', '2025-02-20'),
(19, 'Rohan Khanna', 'Male', '2000-01-30', 'rohan.khanna@example.com', '9876789013', 'Bhopal, India', 'B.Com', 'Finance', '2025-02-20'),
(20, 'Simran Kaur', 'Female', '2001-12-05', 'simran.kaur@example.com', '9876890124', 'Amritsar, India', 'BBA', 'Operations', '2025-02-25');
GO

-- View inserted data
SELECT * FROM Employee1;
