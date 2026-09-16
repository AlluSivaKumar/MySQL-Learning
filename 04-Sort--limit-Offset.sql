-- USE UNIVERSITY;
USE COMPANY;

SELECT * FROM EMPLOYEE;

-- Display employees from the highest salary to the lowest.
SELECT *
FROM EMPLOYEE
ORDER BY SALARY
DESC;

-- Display the first three employees alphabetically by name.
SELECT *
FROM EMPLOYEE
ORDER BY NAME ASC
LIMIT 3;

-- Find the two lowest-paid employees.
SELECT * FROM EMPLOYEE
ORDER BY SALARY ASC
LIMIT 2;

-- Skip the first two highest-paid employees and return the next two.
SELECT * 
FROM EMPLOYEE
ORDER BY SALARY DESC
LIMIT 2 OFFSET 2;

-- Find the highest-paid employee from Hyderabad.
SELECT * FROM EMPLOYEE
WHERE CITY = 'HYDERABAD'
ORDER BY SALARY DESC
LIMIT 1;

-- Sort employees by city alphabetically and salary in descending order within each city.
SELECT * FROM EMPLOYEE
ORDER BY CITY , SALARY DESC;

ALTER TABLE EMPLOYEE
RENAME TO EMPLOYEES;

SHOW TABLES;