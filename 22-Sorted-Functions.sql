CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE IF NOT EXISTS employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    city VARCHAR(50),
    department_id INT
);

INSERT INTO employee (
    employee_id,
    employee_name,
    salary,
    city,
    department_id
)
VALUES
    (101, 'Siva',   65000.00, 'Hyderabad', 1),
    (102, 'Rakesh', 45000.00, 'Chennai',   2),
    (103, 'Murali', 55000.00, 'Hyderabad', 3),
    (104, 'Divya',  75000.00, 'Bengaluru', 1),
    (105, 'Ravi',   40000.00, 'Chennai',   NULL);

SELECT * FROM employee;


-- Annual salary: Create GetAnnualSalary(monthly_salary) that returns monthly salary × 12. Use it to display each employee’s name and annual salary.
DELIMITER //
CREATE FUNCTION GetAnnualSalary( SALARY DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
	RETURN SALARY * 12;
END //
DELIMITER ;

SELECT EMPLOYEE_NAME , SALARY , GetAnnualSalary(SALARY) AS ANNUAL_SALARY
FROM EMPLOYEE;




-- Bonus amount: Create CalculateBonus(salary_amount, bonus_percentage) that returns only the bonus amount. Display each employee’s name and their 10% bonus.
DELIMITER //
CREATE FUNCTION CalculateBonus(SALARY DECIMAL(10,2) , SALARY_PERCENT DECIMAL (10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
	RETURN SALARY * 10/100;
END
// DELIMITER ;

SELECT EMPLOYEE_NAME , SALARY , CalculateBonus(SALARY , 10) AS BONUS
FROM EMPLOYEE;

-- Salary category: Create SalaryCategory(salary_amount) that returns:
-- 'High' when salary ≥ 70000.
-- 'Medium' when salary ≥ 50000 and < 70000.
-- 'Low' when salary < 50000.
DELIMITER //
CREATE FUNCTION SalaryCategory(SALARY DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
NO SQL
BEGIN
	IF SALARY >= 70000 THEN
		RETURN 'HIGH';
    ELSEIF SALARY >= 50000 THEN
		RETURN 'MEDIUM';
	ELSEIF SALARY >= 0 THEN
		RETURN 'LOW';
	ELSE
		RETURN 'FALSE SALARY';
	END IF;
END // 
DELIMITER ;

SELECT EMPLOYEE_NAME , SALARY , SalaryCategory(SALARY) AS SALARY_CATEGORY
FROM EMPLOYEE;

-- Updated salary: Create SalaryAfterIncrement(salary_amount, increment_percentage) that 
-- returns the salary after a percentage increase. Display each employee’s current salary and salary after a 15% increase, without updating the table.
DELIMITER //
CREATE FUNCTION SalaryAfterIncrement ( salary_amount DECIMAL(10,2), increment_percentage DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
	RETURN salary_amount + salary_amount * increment_percentage / 100;
END //
DELIMITER ;

SELECT EMPLOYEE_NAME , SALARY , SalaryAfterIncrement(SALARY , 15) AS SALARYAFTERINCREMENT
FROM EMPLOYEE;





-- Filter using a function: Use your SalaryCategory() function in a WHERE clause to display only employees categorized as 'High'.
SELECT EMPLOYEE_NAME,
       SALARY,
       SalaryCategory(SALARY) AS SALARY_CATEGORY
FROM EMPLOYEE
WHERE SalaryCategory(SALARY) = 'HIGH';


