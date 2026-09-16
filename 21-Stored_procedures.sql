CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE IF NOT EXISTS department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2),
    city VARCHAR(100),
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
    (employee_id, employee_name, salary, city, department_id, manager_id)
VALUES
    (101, 'Siva', 65000.00, 'Hyderabad', 1, NULL),
    (102, 'Rakesh', 45000.00, 'Chennai', 2, 101),
    (103, 'Murali', 55000.00, 'Hyderabad', 3, 101),
    (104, 'Divya', 75000.00, 'Bengaluru', 1, 103),
    (105, 'Ravi', 40000.00, 'Chennai', NULL, 103);
    
SELECT * FROM department;
SELECT * FROM employee;




-- Without parameters: Create GetAllDepartments() to display all rows from department.
DELIMITER //
CREATE PROCEDURE GetEmployeeDetails()
BEGIN
	SELECT * FROM EMPLOYEE;
END //
DELIMITER ;

CALL GetEmployeeDetails();


-- Create GetEmployeesByCity(IN p_city VARCHAR(100)) and call it with 'Hyderabad'.
DELIMITER //
CREATE PROCEDURE GETEMPLOYEESBYCITY( 
	IN P_CITY_NAME VARCHAR(200)
    )
BEGIN
	SELECT * 
    FROM EMPLOYEE
    WHERE CITY = P_CITY_NAME;
END 
//
DELIMITER ;

CALL GETEMPLOYEESBYCITY('HYDERABAD');


-- GetHighestSalary(OUT p_salary DECIMAL(10,2)) to return the highest employee salary. Call it with @highest_salary, then display that variable.
DELIMITER //
CREATE PROCEDURE GETHIGHESTSALARY(OUT P_SALARY DECIMAL(10,2))
BEGIN
	SELECT MAX(SALARY)
    INTO P_SALARY #REDIRECT TO THAT
    FROM EMPLOYEE;
END 
//
DELIMITER ;
CALL GETHIGHESTSALARY(@HIGH_SALARY);
SELECT @HIGH_SALARY AS HIGHEST_SALARY;


-- Create a procedure with an IN department ID and an OUT employee count. Test with department ID 1.
DROP PROCEDURE IF EXISTS Employee_Count_By_Department_Id;

DELIMITER //
CREATE PROCEDURE Employee_Count_By_Department_Id
(
	IN P_DEPARTMENT_ID INT ,
    OUT EMPLOYEE_COUNT_BY_DEPARTMENT INT
)
BEGIN
	SELECT COUNT(*) INTO EMPLOYEE_COUNT_BY_DEPARTMENT
    FROM EMPLOYEE
    WHERE DEPARTMENT_ID = P_DEPARTMENT_ID;
END
//
DELIMITER ;

CALL Employee_Count_By_Department_Id(1 , @EMP_COUNT);

SELECT @EMP_COUNT AS TOTALEMPLOYEE;


-- Create IncreaseAmount(INOUT p_amount DECIMAL(10,2)) that increases the supplied amount by 10%.
-- Set @amount to 5000.
-- Call the procedure with @amount.
-- Display the updated value.
-- Expected result: 5500.00
-- Hint: Inside the procedure, use SET to update p_amount. No table update is needed.

DELIMITER //
	CREATE PROCEDURE IncreaseAmount( INOUT p_amount DECIMAL(10,2) )
    BEGIN
		SET P_AMOUNT = P_AMOUNT + (P_AMOUNT*0.10);
    END
    //
DELIMITER ;

SET @AMOUNT  = 5000;

CALL IncreaseAmount(@AMOUNT);

SELECT @AMOUNT AS FINAL_AMOUNT;


