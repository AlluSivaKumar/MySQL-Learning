CREATE DATABASE COMPANY;

USE COMPANY;

CREATE TABLE DEPARTMENT(
DEPARTMENT_ID INT PRIMARY KEY ,
DEPARTMENT_NAME VARCHAR(20) NOT NULL UNIQUE,
LOCATION VARCHAR(20) NOT NULL
);

CREATE TABLE EMPLOYEE(
EMPLOYEE_ID INT PRIMARY KEY,
EMPLOYEE_NAME VARCHAR(20) NOT NULL,
SALARY DECIMAL(10,2) NOT NULL,
CITY VARCHAR(20),
DEPARTMENT_ID INT,
MANAGER_ID int,

CONSTRAINT FOREIGN_KEY_EMPLOYEE_DEPARTMENT
FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID)
ON DELETE SET NULL
ON UPDATE CASCADE,

CONSTRAINT FOREIGN_KEY_EMPLOYEE_MANAGER
FOREIGN KEY(MANAGER_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
ON DELETE SET NULL
);

INSERT INTO department
    (department_id, department_name, location)
VALUES
    (1, 'IT', 'Hyderabad'),
    (2, 'HR', 'Chennai'),
    (3, 'Sales', 'Bengaluru'),
    (4, 'Finance', 'Mumbai');
    
INSERT INTO employee
    (employee_id, employee_name, salary, city, department_id, manager_id)
VALUES
    (101, 'Siva',   65000, 'Hyderabad', 1,    NULL),
    (102, 'Rakesh', 45000, 'Chennai',   2,    101),
    (103, 'Murali', 55000, 'Hyderabad', 3,    101),
    (104, 'Divya',  75000, 'Bengaluru', 1,    103),
    (105, 'Ravi',   40000, 'Chennai',   NULL, 103);
    
SELECT * FROM department;
SELECT * FROM employee;

-- Find employees whose salary is greater than the average salary.
SELECT *
FROM EMPLOYEE
WHERE SALARY > (
				SELECT AVG(SALARY)
				FROM EMPLOYEE
                );
                
-- Highest Paid Employee
SELECT * 
FROM EMPLOYEE 
WHERE SALARY = (
				SELECT MAX(SALARY) 
                FROM EMPLOYEE
                );
                
-- Lowest Paid Employee
SELECT * 
FROM EMPLOYEE 
WHERE SALARY = (
				SELECT MIN(SALARY) 
                FROM EMPLOYEE
                );
                
-- Find employees earning more than the average salary of IT employees.
SELECT EMPLOYEE_NAME , SALARY 
FROM EMPLOYEE
WHERE SALARY > (
				SELECT AVG(SALARY) 
                FROM EMPLOYEE
                WHERE DEPARTMENT_ID = 1
                );
			
-- Find employees who work in departments located in Hyderabad or Chennai.
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (
						SELECT DEPARTMENT_ID 
                        FROM DEPARTMENT
                        WHERE LOCATION IN ('HYDERABAD','CHENNAI')
						);
					

-- Find employees working in departments located in the same location as the IT department.
SELECT * FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (
						SELECT DEPARTMENT_ID
						FROM DEPARTMENT
						WHERE LOCATION IN (
											SELECT LOCATION 
											FROM DEPARTMENT
											WHERE DEPARTMENT_NAME = 'IT'
                                        )
						);
                        
-- Find employees earning more than their department's average salary.
SELECT E1.EMPLOYEE_NAME , E1.SALARY
FROM EMPLOYEE E1
WHERE SALARY > (
				SELECT AVG(SALARY)
                FROM EMPLOYEE E2
                WHERE E2.DEPARTMENT_ID = E1.DEPARTMENT_ID);
                
-- Find employees who earn the highest salary in their department.
SELECT * 
FROM EMPLOYEE E1
WHERE SALARY = (
				SELECT MAX(SALARY)
                FROM EMPLOYEE E2
                WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
                );


-- Find employees earning more than the company's average salary.
SELECT * 
FROM EMPLOYEE
WHERE SALARY > (
				SELECT AVG(SALARY)
                FROM EMPLOYEE
                );

-- Find the employee earning the maximum salary.
SELECT * 
FROM EMPLOYEE
WHERE SALARY = (
				SELECT MAX(SALARY)
                FROM EMPLOYEE
                );

-- Find employees earning less than the company's average salary.
SELECT *
FROM EMPLOYEE
WHERE SALARY < (
				SELECT AVG(SALARY)
                FROM EMPLOYEE);

-- Find employees who belong to departments located in Hyderabad.
 SELECT * 
 FROM EMPLOYEE
 WHERE DEPARTMENT_ID IN (
				SELECT DEPARTMENT_ID
                FROM DEPARTMENT
                WHERE LOCATION = 'HYDERABAD'
                );

-- Find employees whose department is located in either Hyderabad or Chennai.
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (
				SELECT DEPARTMENT_ID
				FROM DEPARTMENT
				WHERE LOCATION IN ('HYDERABAD' , 'CHENNAI')
				);

-- Find employees earning more than ANY employee working in the IT department.
SELECT * 
FROM EMPLOYEE
WHERE SALARY > ANY (
					SELECT SALARY
                    FROM EMPLOYEE
                    WHERE DEPARTMENT_ID = (
											SELECT DEPARTMENT_ID
                                            FROM DEPARTMENT
                                            WHERE DEPARTMENT_NAME = 'IT'
                                            )
                    );

-- Find employees earning more than ALL employees working in the HR department.
SELECT *
FROM EMPLOYEE
WHERE SALARY > ALL (
					SELECT SALARY
                    FROM EMPLOYEE
                    WHERE DEPARTMENT_ID = (
											SELECT DEPARTMENT_ID
                                            FROM DEPARTMENT
                                            WHERE DEPARTMENT_NAME = 'HR'
                                            )
					);

-- Find employees earning more than their own department's average salary.
SELECT *
FROM EMPLOYEE E1
WHERE SALARY > (
				SELECT AVG(SALARY)
                FROM EMPLOYEE E2
                WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
                );

-- Find employees receiving the highest salary in their respective departments.
SELECT * 
FROM EMPLOYEE E1
WHERE SALARY = (
				SELECT MAX(SALARY) 
                FROM EMPLOYEE E2
                WHERE E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
                );
                

-- Find departments that currently have no employees.
SELECT DEPARTMENT_NAME 
FROM DEPARTMENT
WHERE DEPARTMENT_ID NOT IN (
						SELECT DEPARTMENT_ID 
                        FROM EMPLOYEE
                        WHERE DEPARTMENT_ID IS NOT NULL
						);
                        
DROP DATABASE COMPANY;
