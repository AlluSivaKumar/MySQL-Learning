CREATE DATABASE IF NOT EXISTS case_practice;

USE case_practice;

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    city VARCHAR(50),
    department_id INT,
    manager_id INT,

    FOREIGN KEY (department_id)
        REFERENCES department(department_id),

    FOREIGN KEY (manager_id)
        REFERENCES employee(employee_id)
);

INSERT INTO department
    (department_id, department_name, location)
VALUES
    (1, 'IT', 'Hyderabad'),
    (2, 'HR', 'Chennai'),
    (3, 'Sales', 'Bengaluru'),
    (4, 'Finance', 'Mumbai'),
    (5, 'Support', 'Hyderabad');

INSERT INTO employee
    (employee_id, employee_name, salary, city,
     department_id, manager_id)
VALUES
    (101, 'Siva Kumar', 85000, 'Hyderabad', 1, NULL);

INSERT INTO employee
    (employee_id, employee_name, salary, city,
     department_id, manager_id)
VALUES
    (102, 'Rakesh', 45000, 'Chennai', 2, 101),
    (103, 'Murali', 55000, 'Hyderabad', 3, 101),
    (104, 'Divya', 75000, 'Bengaluru', 1, 101),
    (105, 'Ravi', 40000, 'Chennai', NULL, 101),
    (106, 'Priya', 80000, 'Mumbai', 4, 101),
    (107, 'Kiran', 50000, 'Hyderabad', 5, 101),
    (108, 'Sneha', 65000, 'Bengaluru', 1, 101),
    (109, 'Arjun', 70000, 'Hyderabad', 3, NULL),
    (110, 'Meena', 35000, 'Mumbai', NULL, NULL);

SELECT * FROM department;

SELECT * FROM employee;

-- Display employee names and salaries with labels: High for salary ≥ 70,000, Medium for salary ≥ 50,000, and Low otherwise.
SELECT EMPLOYEE_NAME , SALARY ,
CASE 
	WHEN SALARY >= 70000 THEN 'HIGH'
    WHEN SALARY >= 50000 THEN 'MEDIUM'
    ELSE 'LOW'
END AS SALARY_LABEL
FROM EMPLOYEE;

-- Display employee names and a label: Assigned when department_id is present and Unassigned when it is NULL.
SELECT EMPLOYEE_NAME ,
CASE 
	WHEN DEPARTMENT_ID IS NOT NULL THEN 'ASSIGNED'
    ELSE 'UNASSIGNED'
END AS DEPARTMENT_LABEL
FROM EMPLOYEE;

-- Label employees from Hyderabad as Local and everyone else as Non-local.
SELECT EMPLOYEE_NAME , 
CASE
	WHEN CITY = 'HYDERABAD' THEN 'LOCAL'
    ELSE 'NON LOCAL'
END AS PLACE
FROM EMPLOYEE;

-- Display employee names with Top Earner for salaries ≥ 75,000 and Regular Earner otherwise.
SELECT EMPLOYEE_NAME,
CASE
	WHEN SALARY >= 75000 THEN 'TOP EARNER'
    ELSE 'REGULAR EARNER'
END AS EARNING
FROM EMPLOYEE;

-- Calculate a proposed bonus: 15% of salary for employees earning below 50,000 and 10% otherwise.
SELECT EMPLOYEE_NAME, SALARY ,
CASE 
	WHEN SALARY < 50000 THEN ROUND(0.15 * SALARY,2)
    ELSE ROUND(0.10 * SALARY,2)
END AS BONUS
FROM EMPLOYEE;

-- Display No Manager when manager_id is NULL; otherwise display Has Manager.
SELECT EMPLOYEE_NAME ,
CASE
	WHEN MANAGER_ID IS NOT NULL THEN 'HAS MANAGER'
    ELSE 'NO MANAGER'
END AS HAVE_MANAGER
FROM EMPLOYEE;

-- Label salaries as Below Range below 45,000, Within Range from 45,000 through 65,000, and Above Range above 65,000.
SELECT EMPLOYEE_NAME ,
CASE
	WHEN SALARY < 45000 THEN 'BELOW 45000'
    WHEN SALARY <= 65000 THEN 'BELOW 65000'
    ELSE 'ABOVE 65000'
END AS SALARY_LABEL
FROM EMPLOYEE;

-- Count employees in each salary category from question 1.
SELECT
CASE 
	WHEN SALARY >= 70000 THEN 'HIGH'
    WHEN SALARY >= 50000 THEN 'MEDIUM'
    ELSE 'LOW'
END AS SALARY_LABEL ,
COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEE
GROUP BY SALARY_LABEL;

-- Use SUM(CASE WHEN ... THEN 1 ELSE 0 END) to count assigned and unassigned employees in separate columns.
SELECT
SUM(CASE 
	WHEN DEPARTMENT_ID IS NOT NULL THEN 1
    ELSE 0
END) AS ASSIGNED_EMPLOYEES,

SUM(CASE 
	WHEN DEPARTMENT_ID IS NULL THEN 1
    ELSE 0
END) AS UNASSIGNED_EMPLOYEES
FROM EMPLOYEE;

-- Sort employees so Hyderabad employees appear first, then other employees; within each group, sort salary from highest to lowest.
SELECT EMPLOYEE_NAME , SALARY , CITY
FROM EMPLOYEE
ORDER BY
		CASE
			WHEN CITY = 'HYDERABAD' THEN 0
			ELSE 1
		END ASC , 
	SALARY DESC;
