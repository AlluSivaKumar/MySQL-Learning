-- Create database
CREATE DATABASE IF NOT EXISTS company;

-- Select database
USE company;

-- Create employee table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    manager_id INT
);

-- Insert employee records
INSERT INTO employee
    (employee_id, name, department, salary, city, manager_id)
VALUES
    (1, 'Siva',   'IT',      65000, 'Hyderabad', 101),
    (2, 'Rakesh', 'HR',      45000, 'Chennai',   102),
    (3, 'Murali', 'Sales',   55000, 'Hyderabad', NULL),
    (4, 'Divya',  'IT',      75000, 'Bengaluru', 101),
    (5, 'Ravi',   'Finance', 40000, 'Chennai',   NULL);
    
-- Display table structure
DESCRIBE employee;

-- Display all employees
SELECT *
FROM employee;

-- Work in IT or Sales
SELECT * FROM
EMPLOYEE
WHERE department = 'IT' OR department = 'SALES';

-- Earn between 50000 and 70000
SELECT * 
FROM EMPLOYEE
WHERE SALARY between 50000 AND 70000;

-- Have the letter a in their name
SELECT * FROM
EMPLOYEE
WHERE NAME LIKE '%A%';

-- Have a manager assigned;
SELECT * FROM EMPLOYEE
WHERE manager_id IS NOT NULL;

-- Find employees earning at least 50000
SELECT * FROM EMPLOYEE
WHERE SALARY >= 50000;

-- Find employees from IT or Finance.
SELECT * FROM
EMPLOYEE
WHERE department = 'IT' OR department = 'Finance';

-- Employees working in IT or Sales
SELECT *
FROM employee
WHERE department IN ('IT', 'Sales');

-- Find employees whose salaries are between 45000 and 65000.
SELECT * 
FROM EMPLOYEE
WHERE SALARY between 45000 AND 65000;

-- Find names beginning with R.;
SELECT * 
FROM EMPLOYEE
WHERE NAME LIKE 'R%';

-- Find names ending with a.
SELECT * FROM EMPLOYEE
WHERE NAME LIKE '%A';

-- Find names containing iv.
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEE_id = 4;

-- Find employees who are not in HR.
SELECT * FROM
EMPLOYEE
WHERE department != 'HR';

-- Find employees without a manager.
SELECT * FROM EMPLOYEE
WHERE MANAGER_ID IS NOT NULL;

-- Find IT employees earning more than 60000.
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT = 'IT' AND SALARY > 60000;

-- Find employees from Hyderabad whose names start with S.
SELECT * FROM EMPLOYEE
WHERE city = 'Hyderabad'
AND NAME LIKE 'S%';