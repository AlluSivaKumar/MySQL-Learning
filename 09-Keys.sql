-- Primary Key: The selected key that uniquely identifies each record and cannot contain NULL.
-- Foreign Key: A column that references a key in another table and creates a relationship.
-- Candidate Key: A minimal key capable of uniquely identifying a record.
-- Super Key: Any column combination capable of uniquely identifying a record.
-- Alternate Key: A Candidate Key that was not selected as the Primary Key.
-- Composite Key: A key made from two or more columns.
-- Unique Key: A constraint that prevents duplicate values.
-- Natural Key: A meaningful real-world identifier.
-- Surrogate Key: An artificial identifier created by the database or application.

USE company;

CREATE TABLE DEPARTMENT (
DEPARTMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
DEPARTMENT_NAME VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE EMPLOYEE(
EMPLOYEE_ID INT PRIMARY KEY AUTO_INCREMENT,
AADHAR_NUMBER VARCHAR(20) NOT NULL UNIQUE,
EMAIL VARCHAR(50) NOT NULL UNIQUE,
EMPLOYEE_NAME VARCHAR(20) NOT NULL,
DEPARTMENT_ID INT,

CONSTRAINT FOREIGH_KEY_DEPARTMENT_ID
FOREIGN KEY (DEPARTMENT_ID) 
REFERENCES DEPARTMENT(DEPARTMENT_ID)
ON DELETE SET NULL
ON UPDATE CASCADE

);

CREATE TABLE PROJECT (
PROJECT_ID INT PRIMARY KEY AUTO_INCREMENT,
PROJECT_NAME VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employee_project (
    employee_id INT,
    project_id INT,
    assigned_date DATE NOT NULL,
    
    CONSTRAINT FOREIGN_KEY_EMPLOYEE_ID
    FOREIGN KEY (EMPLOYEE_ID)
    REFERENCES EMPLOYEE(EMPLOYEE_ID)
    ON DELETE CASCADE,
    
    CONSTRAINT fk_ep_project
        FOREIGN KEY (project_id)
        REFERENCES project(project_id)
        ON DELETE CASCADE
    
    );
    
    DESCRIBE EMPLOYEE_PROJECT;
    
ALTER TABLE DEPARTMENT
RENAME TO DEPARTMENT_4;
    
ALTER TABLE EMPLOYEE
RENAME TO EMPLOYEE_6;

ALTER TABLE PROJECT
RENAME TO PROJECT2;

ALTER TABLE employee_project
RENAME TO EMPLOYEE_PROJECT_2;

