CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE conditional_practice (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    city VARCHAR(50),
    phone VARCHAR(15),
    alternate_phone VARCHAR(15),
    bonus DECIMAL(10,2)
);

INSERT INTO conditional_practice
    (employee_id, employee_name, salary, city, phone, alternate_phone, bonus)
VALUES
    (101, 'Siva',   65000, 'Hyderabad', '9000000001', NULL,         5000),
    (102, 'Rakesh', 45000, 'Chennai',   NULL,         '9000000002', 0),
    (103, 'Murali', 55000, NULL,        NULL,         NULL,         3000),
    (104, 'Divya',  75000, '',          '9000000004', '9000000005', NULL),
    (105, 'Ravi',   40000, 'Bengaluru', NULL,         '9000000006', 0);

SELECT * FROM conditional_practice;


-- IF() — Salary category: Display each employee’s name, salary, and a column named salary_category. 
-- Show 'High Salary' when salary is at least ₹50,000; otherwise show 'Low Salary'.
SELECT EMPLOYEE_NAME , SALARY ,
IF(SALARY >= 50000 , 'HIGH SALARY' , 'LOW SALARY') AS SALARY_CATEGORY
FROM conditional_practice;


-- IFNULL() — Missing bonus: Display each employee’s name and bonus. 
-- Replace a NULL bonus with 0, and name the result bonus_amount.
SELECT EMPLOYEE_NAME , BONUS ,
IFNULL(BONUS , 0) AS BONUS_AMOUNT 
FROM conditional_practice;


-- NULLIF() — Zero bonus: Display each employee’s name and bonus, but return NULL when the bonus is 0.
--  Keep other bonus values unchanged. Name the result adjusted_bonus.
SELECT EMPLOYEE_NAME , BONUS ,
NULLIF(BONUS , 0) AS ADJUSTED_BONUS
FROM conditional_practice;

-- COALESCE() — Contact preference: Display each employee’s name and a column named contact_number. 
-- Use phone first, then alternate_phone if the phone is missing. If both are NULL, show 'No Contact Available'.
SELECT EMPLOYEE_NAME ,
COALESCE(PHONE , ALTERNATE_PHONE , 'NO CONTACT AVALIBLE') AS CONTACT_NUMBER
FROM conditional_practice;

-- NULLIF() + COALESCE() — Missing city: Display each employee’s name and a column named city_name. 
-- Show 'Not Available' when the city is either NULL or an empty string (''); otherwise show the existing city.
SELECT EMPLOYEE_NAME , 
COALESCE(NULLIF(CITY , '') , 'NOT AVALIBLE') AS CITY_NAME
FROM conditional_practice;