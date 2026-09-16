CREATE DATABASE COMPANY;

USE COMPANY;

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) NOT NULL
);

INSERT INTO department
    (department_id, department_name, location)
VALUES
    (1, 'IT',      'Hyderabad'),
    (2, 'HR',      'Chennai'),
    (3, 'Sales',   'Bengaluru'),
    (4, 'Finance', 'Mumbai'),
    (5, 'Support', 'Hyderabad');
    
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    city VARCHAR(50),
    department_id INT,
    manager_id INT,

    CONSTRAINT fk_company_emp_department
        FOREIGN KEY (department_id)
        REFERENCES department(department_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT fk_company_emp_manager
        FOREIGN KEY (manager_id)
        REFERENCES employee(employee_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

INSERT INTO employee
    (employee_id, employee_name, salary, city, department_id, manager_id)
VALUES
    (101, 'Siva', 65000.00, 'Hyderabad', 1, NULL);
    
INSERT INTO employee
    (employee_id, employee_name, salary, city, department_id, manager_id)
VALUES
    (103, 'Murali', 55000.00, 'Hyderabad', 3, 101);
    
INSERT INTO employee
    (employee_id, employee_name, salary, city, department_id, manager_id)
VALUES
    (102, 'Rakesh', 45000.00, 'Chennai',   2, 101),
    (104, 'Divya',  75000.00, 'Bengaluru', 1, 103),
    (105, 'Ravi',   40000.00, 'Chennai',   NULL, 103),
    (106, 'Priya',  50000.00, 'Mumbai',    4, 101),
    (107, 'Kiran',  35000.00, 'Hyderabad', 5, 103);
    
CREATE TABLE developer_skills_a (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(50) NOT NULL
);

INSERT INTO developer_skills_a
    (skill_id, skill_name)
VALUES
    (1, 'Java'),
    (2, 'SQL'),
    (3, 'MySQL'),
    (4, 'Java');
    
CREATE TABLE developer_skills_b (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(50) NOT NULL
);

INSERT INTO developer_skills_b
    (skill_id, skill_name)
VALUES
    (1, 'SQL'),
    (2, 'Python'),
    (3, 'JavaScript'),
    (4, 'SQL');
    
SELECT * FROM department;

SELECT * FROM employee;

SELECT * FROM developer_skills_a;

SELECT * FROM developer_skills_b;

-- Display all unique cities from employee and department.
SELECT LOCATION FROM DEPARTMENT
UNION 
SELECT CITY FROM EMPLOYEE;

-- Display all cities, including duplicates.
SELECT LOCATION FROM DEPARTMENT
UNION ALL
SELECT CITY FROM EMPLOYEE;

-- Find skills available in both skill tables.
SELECT SKILL_NAME FROM developer_skills_a
INTERSECT
SELECT SKILL_NAME FROM developer_skills_b;

-- Find skills available only in developer_skills_a.
SELECT SKILL_NAME FROM developer_skills_a
INTERSERT
SELECT SKILL_NAME FROM developer_skills_b;

-- Find skills available only in developer_skills_b.
SELECT SKILL_NAME FROM developer_skills_b
EXCEPT
SELECT SKILL_NAME FROM developer_skills_a;

-- Combine employee names and department names into one column called record_name.
SELECT EMPLOYEE_NAME AS RECORD_NAME
FROM EMPLOYEE
UNION
SELECT DEPARTMENT_NAME 
FROM DEPARTMENT;

-- Return the two highest-paid and two lowest-paid employees using UNION ALL.
(SELECT EMPLOYEE_NAME , SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC
LIMIT 2)
UNION ALL
(SELECT EMPLOYEE_NAME , SALARY
FROM EMPLOYEE
ORDER BY SALARY ASC
LIMIT 2);

-- Rewrite INTERSECT using EXISTS.
(SELECT skill_name
FROM developer_skills_a)
INTERSECT
(SELECT skill_name
FROM developer_skills_b);

SELECT DISTINCT a.skill_name
FROM developer_skills_a AS a
WHERE EXISTS (
    SELECT 1
    FROM developer_skills_b AS b
    WHERE b.skill_name = a.skill_name
);

-- Rewrite EXCEPT using NOT EXISTS.
(SELECT skill_name
FROM developer_skills_a)
EXCEPT
(SELECT skill_name
FROM developer_skills_b);

SELECT DISTINCT a.skill_name
FROM developer_skills_a AS a
WHERE NOT EXISTS (
    SELECT 1
    FROM developer_skills_b AS b
    WHERE b.skill_name = a.skill_name
);

-- Explain why UNION ALL is normally faster than UNION.
-- BECAUSE IT AUTOMATILLY RETRIVES THE DATA , INSTEAD OF GIVING UNIQUE OR DISTINCT VALUES

DROP DATABASE COMPANY;
