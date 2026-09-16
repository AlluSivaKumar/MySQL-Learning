CREATE DATABASE railway_reservation_db;

SHOW DATABASES;

USE railway_reservation_db;

USE railway_reservation_db;

SHOW TABLES;

DESCRIBE users;

USE railway_reservation_db;

SELECT
    id,
    name,
    email,
    password,
    role,
    is_verified,
    created_at
FROM users;

USE railway_reservation_db;

SELECT id, name, email, otp, otp_expiry, is_verified
FROM users
WHERE email = 'sivakumarallu4@gmail.com';

USE railway_reservation_db;

DELETE FROM users
WHERE email = 'sivakumarallu4@gmail.com';

SELECT id, name, email, otp, otp_expiry, is_verified
FROM users
WHERE email = 'sivakumarallu4@gmail.com';


USE railway_reservation_db;

SELECT
    id,
    name,
    email,
    role,
    otp,
    otp_expiry,
    is_verified
FROM users
WHERE email = 'sivakumarallu4@gmail.com';


USE railway_reservation_db;

SHOW TABLES;

DESCRIBE trains;

USE railway_reservation_db;

SELECT *
FROM trains;

DESCRIBE bookings;

USE railway_reservation_db;

SHOW TABLES;

DESCRIBE passengers;

SELECT * FROM bookings;
SELECT * FROM passengers;

USE railway_reservation_db;

SELECT
    id,
    pnr,
    journey_date,
    passenger_count,
    total_fare,
    status,
    train_id,
    user_id
FROM bookings;

USE railway_reservation_db;

SELECT
    id,
    name,
    email,
    role,
    is_verified
FROM users;

SELECT id, name, email, role, verified
FROM users
WHERE email = 'sivakumarallu4+admin@gmail.com';

DESC users;

SELECT id, name, email, role, is_verified
FROM users
WHERE email = 'sivakumarallu4+admin@gmail.com';

UPDATE users
SET role = 'ADMIN'
WHERE id = 5;

SELECT id, name, email, role, is_verified
FROM users
WHERE id = 5;

SELECT USER(), CURRENT_USER(), @@port;

UPDATE trains
SET arrival_time = '14:15:00'
WHERE id = 3
  AND train_number = '18005';

SELECT * 
FROM
trains;


DELETE FROM trains
where train_number = '20708';