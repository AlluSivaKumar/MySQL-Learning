-- USE UNIVERSITY;
USE COMPANY;

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    city VARCHAR(50) NOT NULL,
    join_date DATE NOT NULL
);

INSERT INTO employee
    (employee_id, name, department, salary, city, join_date)
VALUES
    (1, 'Siva Kumar', 'IT',      65000.00, 'Hyderabad', '2024-01-15'),
    (2, 'Rakesh',     'HR',      45000.00, 'Chennai',   '2023-06-10'),
    (3, 'Murali',     'Sales',   55000.00, 'Hyderabad', '2022-03-20'),
    (4, 'Divya',      'IT',      75000.00, 'Bengaluru', '2024-08-05'),
    (5, 'Ravi',       'Finance', 40000.00, 'Chennai',   '2021-11-12');
    
SELECT * FROM EMPLOYEE;

-- Find the total number of employees.
SELECT COUNT(*)
FROM EMPLOYEE;

-- Find the total salary paid by the company.
SELECT SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEE;

-- Find the highest and lowest salaries.
SELECT 
MAX(SALARY) AS HIGHEST_SALARY,
MIN(SALARY) AS LOWEST_SALARY
FROM EMPLOYEE;

-- Display the average salary rounded to two decimal places.
SELECT 
ROUND(AVG(SALARY),2) AS AVERAGE_SALARY_ROUNDED_TO_TWO_DECIMALS
FROM EMPLOYEE;

-- Count the number of employees in each city.
SELECT 
CITY , COUNT(employee_id) as Employee_Count
from employee
group by city;

-- Display employee names in uppercase.
SELECT UPPER(NAME) AS EMPLOYEE_NAMES
FROM EMPLOYEE;

-- Display the first four characters of each employee's name.
SELECT LEFT(NAME , 4) AS EMPLOYEE_NAMES
FROM EMPLOYEE;

-- Combine the employee name, department, and city using -.
SELECT CONCAT_WS('-', NAME , DEPARTMENT , CITY) AS EMPLOYEE_DETAILS
FROM EMPLOYEE;

-- Find the length of every employee's name.
SELECT NAME , LENGTH(NAME) AS NAME_LENGTH
FROM EMPLOYEE;

-- Replace Hyderabad with HYD.
SELECT REPLACE(CITY , 'Hyderabad' , 'HYD') as Short_city
FROM EMPLOYEE;

-- Find employees with odd employee IDs using MOD().
SELECT * 
FROM EMPLOYEE
WHERE MOD(EMPLOYEE_ID,2) != 0;

-- Display every employee's joining year.
SELECT EMPLOYEE_ID, NAME , YEAR(join_date) as Joining_Year
from employee;

-- Display the month name in which every employee joined.
SELECT EMPLOYEE_ID, NAME , MONTHNAME(join_date) as Joining_Month
from employee;

-- Calculate the number of days each employee has worked.
SELECT EMPLOYEE_ID, NAME , ABS(DATEDIFF(JOIN_DATE , CURDATE())) AS TOTAL_DAYS_WORKED
FROM EMPLOYEE;

-- Calculate each employee's completed years of experience.
SELECT EMPLOYEE_ID , NAME , YEAR(CURDATE()) - YEAR(join_date) AS YEARS_OF_EXPERIENCE
FROM EMPLOYEE;

SELECT employee_id,
       name,
       TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS years_of_experience
FROM employee;

-- Calculate the probation end date as six months after joining.
SELECT EMPLOYEE_ID, NAME ,JOIN_DATE ,DATE_ADD(JOIN_DATE , INTERVAL 6 MONTH) AS NEW_JOIN_DATE
FROM EMPLOYEE;

-- Format join_date as 15 January 2024.
SELECT employee_id , NAME , DATE_FORMAT(JOIN_DATE, '%d %M %Y')
from employee;

-- Find the number of employees who joined in each year.
SELECT COUNT(*) , YEAR(JOIN_DATE) AS JOINING_YEAR
FROM EMPLOYEE
GROUP BY JOINING_YEAR;

-- Find the department with the highest average salary.
SELECT DEPARTMENT , AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY AVG_SALARY DESC
LIMIT 1;

-- Select one employee randomly.
SELECT * 
FROM EMPLOYEE
ORDER BY RAND()
LIMIT 1;


ALTER TABLE EMPLOYEE 
RENAME TO EMPLOYEE_2;

SHOW TABLES;