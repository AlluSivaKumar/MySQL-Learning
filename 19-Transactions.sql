CREATE DATABASE BANK;
USE BANK;



CREATE TABLE ACCOUNT (
ID INT PRIMARY KEY,
ACCOUNT_HOLDER VARCHAR(20),
BALANCE DECIMAL(10 , 2) NOT NULL
);
INSERT INTO account (id, account_holder, balance)
VALUES
    (1, 'Siva', 10000.00),
    (2, 'Rakesh', 5000.00);
SHOW TABLE STATUS LIKE 'ACCOUNT';


-- COMMIT EXAMPLE
START TRANSACTION;
UPDATE account
SET balance = balance - 1000
WHERE id = 1;
UPDATE account
SET balance = balance + 1000
WHERE id = 2;
COMMIT;
SELECT * FROM account;


-- ROLLBACK EXAMPLE
START TRANSACTION;
UPDATE account
SET balance = balance - 2000
WHERE id = 1;
SELECT * FROM account;
ROLLBACK;
SELECT * FROM account;




START TRANSACTION;
UPDATE account
SET balance = balance + 500
WHERE id = 1;
SAVEPOINT after_siva_bonus;
UPDATE account
SET balance = balance + 2000
WHERE id = 2;
ROLLBACK TO SAVEPOINT after_siva_bonus;
COMMIT;
SELECT * FROM account;
-- Siva’s bonus happened before the savepoint, so it remains. Rakesh’s update happened after the savepoint, so it is undone.

-- Add ₹1,000 to Siva’s balance and commit.
START TRANSACTION;
UPDATE ACCOUNT
SET BALANCE = BALANCE + 1000
WHERE ID = 1;
COMMIT;

-- Subtract ₹500 from Rakesh’s balance, then undo it.
START TRANSACTION;
UPDATE ACCOUNT
SET BALANCE = BALANCE - 500
WHERE ID = 2;
ROLLBACK;

-- Update Siva’s balance, create a savepoint, update Rakesh’s balance, then undo only Rakesh’s update and commit.
START TRANSACTION;
UPDATE ACCOUNT
SET BALANCE = BALANCE + 1000
WHERE ID = 1;
SAVEPOINT AFTER_UPDATED_SIVA_BALANCE;
UPDATE ACCOUNT
SET BALANCE = BALANCE - 500
WHERE ID = 2;
ROLLBACK TO AFTER_UPDATED_SIVA_BALANCE;
COMMIT;

-- Transfer ₹300 from Rakesh to Siva in one transaction.
START TRANSACTION;
UPDATE ACCOUNT
SET BALANCE = BALANCE + 300
WHERE ID = 1;
UPDATE ACCOUNT
SET BALANCE = BALANCE - 300
WHERE ID = 2;
COMMIT;

-- What happens if you execute ROLLBACK after COMMIT?
-- NOTHING IS ROLLBACKED , JUST THE COMMITED QUERY HAPPENED

