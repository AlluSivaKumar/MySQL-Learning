USE company;

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO employee
    (employee_id, name, department, salary, city)
VALUES
    (1, 'Siva Kumar', 'IT',      65000.00, 'Hyderabad'),
    (2, 'Rakesh',     'HR',      45000.00, 'Chennai'),
    (3, 'Murali',     'Sales',   55000.00, 'Hyderabad'),
    (4, 'Divya',      'IT',      75000.00, 'Bengaluru'),
    (5, 'Ravi',       'Finance', 40000.00, 'Chennai');
    
SELECT * FROM EMPLOYEE;



-- Count the employees in each department.
SELECT DEPARTMENT , COUNT(EMPLOYEE_ID)
FROM EMPLOYEE
GROUP BY DEPARTMENT;

-- Calculate the total salary paid by each department.
SELECT DEPARTMENT , SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT;

-- Find the average salary in each city.
SELECT CITY , ROUND(AVG(SALARY ),2) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY CITY;

-- Find the highest salary in each department.
SELECT DEPARTMENT , MAX(SALARY) AS HIGHEST_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT;

-- Find the lowest salary in each city.
SELECT DEPARTMENT , MIN(SALARY) AS LOWEST_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT;

-- Count employees for every city-and-department combination.
SELECT CITY , DEPARTMENT , COUNT(*)
FROM EMPLOYEE
GROUP BY CITY , DEPARTMENT;

-- Display departments ordered by average salary from highest to lowest.
SELECT DEPARTMENT , ROUND(AVG(SALARY),2) AS AVG_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY AVG_SALARY DESC;

-- Find the city with the highest total salary.
SELECT CITY , SUM(SALARY) AS HIGHEST_TOTAL_SALARY
FROM EMPLOYEE
GROUP BY CITY
ORDER BY HIGHEST_TOTAL_SALARY DESC
LIMIT 1;

-- Calculate the average salary by department only for Chennai employees.
SELECT DEPARTMENT , ROUND(AVG(SALARY),2) AVG_SALARY
FROM EMPLOYEE
WHERE CITY = 'CHENNAI'
GROUP BY DEPARTMENT;

-- Find the department containing the greatest number of employees.
SELECT DEPARTMENT , COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY TOTAL_EMPLOYEES DESC
LIMIT 1;