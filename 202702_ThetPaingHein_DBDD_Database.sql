-- create database
CREATE DATABASE eliteclean_db;

-- create customer table
CREATE TABLE customer
(customer_id integer not null,
customer_name varchar(50) not null,
customer_email varchar(80) not null,
customer_phnum varchar(20) not null,
customer_city varchar(50) not null,
customer_dob date not null,
Primary Key(customer_id));
DESC customer;

-- create staff type table
CREATE TABLE staff_type
(staff_type_id int not null,
staff_type varchar(30) not null,
basic_salary float(12,2) not null,
Primary Key(staff_type_id)
);
DESC staff_type;

-- create staff team table
CREATE TABLE team
(team_id int not null,
team_name varchar(50) not null,
team_phnum varchar(20) not null,
team_city varchar(50) not null,
team_leader_id int not null,
team_leader_name varchar(50) not null,
Primary Key(team_id));
DESC team;

-- create service table
CREATE TABLE service
(service_id int not null,
service_name varchar(50) not null,
price float(12,2) not null,
service_desc varchar(100) not null,
Primary Key(service_id)
);
DESC service;

-- create schedule table
CREATE TABLE schedule
(schedule_id int not null,
schedule_day varchar(30) not null,
schedule_time varchar(30) not null,
Primary Key(schedule_id)
);
DESC schedule;

-- create promotion table
CREATE TABLE promotion
(promotion_id varchar(20) not null,
promotion_name varchar(50) not null,
promotion_desc varchar(100) not null,
Primary Key(promotion_id)
);
DESC promotion;

-- create staff table
CREATE TABLE staff
(staff_id int not null,
staff_name varchar(50) not null,
staff_phnum varchar(20) not null,
staff_email varchar(80) not null,
staff_address varchar(100) not null,
staff_dob date not null,
staff_type_id int not null,
team_id int not null,
Primary Key(staff_id),
Foreign Key(staff_type_id) References staff_type(staff_type_id),
Foreign Key(team_id) References team(team_id));
DESC staff;


-- create booking table
create table booking
(booking_id int not null,
booking_date date not null,
service_date date not null,
booking_address varchar(100) not null,
booking_city varchar(30) not null,
sub_total float(12,2) not null,
total float(12,2) not null,
team_id int not null,
customer_id int not null,
promotion_id varchar(20) null,
Primary Key(booking_id),
Foreign Key(team_id) references team(team_id),
Foreign Key(customer_id) references customer(customer_id),
Foreign Key(promotion_id) references promotion(promotion_id));
DESC booking;


-- create booking service table
create table booking_service
(
booking_id int not null,
service_id int not null,
Foreign Key(booking_id) references booking(booking_id),
Foreign Key(service_id) references service(service_id)
);
DESC booking_service;





-- create service team table
-- create table service_team
-- (
-- team_id int not null,
-- service_id int not null,
-- Foreign Key(team_id) references team(team_id),
-- Foreign Key(service_id) references service(service_id)
-- );

-- create staff team table
-- create table staff_team
-- (
-- staff_id int not null,
-- team_id int not null,
-- Foreign Key(staff_id) references booking(booking_id),
-- Foreign Key(team_id) references service(service_id)
-- );



-- create team schedule table
Create table team_schedule
(
team_id int not null,
schedule_id int not null,
Foreign Key(team_id) references team(team_id),
Foreign Key(schedule_id) references schedule(schedule_id)
);
DESC team_schedule;




-- create payment table
CREATE TABLE payment
(payment_id int not null,
payment_type varchar(30) not null,
payment_date date not null,
payment_amount float(12,2) not null,
booking_id int not null,
Primary Key(payment_id),
Foreign Key(booking_id) references booking(booking_id));
DESC payment;



-- Inserting Into customer table
INSERT INTO customer VALUES
(1, 'Alice Smith', 'alice.smith@example.com', '1234567890', 'London','2000-01-15' ),
(2, 'Bob Johnson', 'bob.johnson@example.com', '1234567891', 'Manchester', '1981-02-20'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '1234567892', 'London', '1987-03-25'),
(4, 'David Wilson', 'david.wilson@example.com', '1234567893', 'Manchester', '1985-04-10'),
(5, 'Eva Davis', 'eva.davis@example.com', '1234567894', 'London','1984-05-05' ),
(6, 'Frank Harris', 'frank.harris@example.com', '1234567895', 'London','1996-06-30' ),
(7, 'Grace Clark', 'grace.clark@example.com', '1234567896', 'London', '1992-07-18'),
(8, 'Hank Lewis', 'hank.lewis@example.com', '1234567897', 'London','1987-08-22' ),
(9, 'Ivy Walker', 'ivy.walker@example.com', '1234567898', 'London','1988-09-13' ),
(10, 'Jack Hall', 'jack.hall@example.com', '1234567899', 'Manchester','1994-10-29' );

SELECT * FROM customer;

-- Insert Into staff type table
INSERT INTO staff_type VALUES
(1, 'Senior', 2000.00),
(2, 'Junior', 1300.00),
(3, 'Intern', 700.00);

SELECT * FROM staff_type;

-- Insert Into team table
INSERT INTO team VALUES
(1, 'Team Alpha', '3456789012','London', 1, 'John Adams'),
(2, 'Team Beta', '3456789013','London', 3, 'Oscar White'),
(3, 'Team Gemma', '3456789014','Manchester', 6, 'Rachel Moore'),
(4, 'Team Delta', '3456789015','London', 8,'Tina Scott' );

SELECT * FROM team;

-- Insert Into staff table
INSERT INTO staff VALUES
(1, 'John Adams', '2345678901', 'john.adams@example.com', '1 Elm St, London', '1990-11-17', 1, 1),
(2, 'Nancy Green', '2345678902', 'nancy.green@example.com', '2 Maple St, Manchester','1991-12-03', 1, 3),
(3, 'Oscar White', '2345678903', 'oscar.white@example.com', '3 Oak St, London','1991-01-19', 1, 2),
(4, 'Paula Black', '2345678904', 'paula.black@example.com', '4 Pine St, London','1994-02-14', 2, 1),
(5, 'Quincy Brown', '2345678905', 'quincy.brown@example.com', '5 Cedar St, London','1994-03-10', 2, 2),
(6, 'Rachel Moore', '2345678906', 'rachel.moore@example.com', '6 Birch St, Manchester','1995-04-25', 2, 3),
(7, 'Sam Taylor', '2345678907', 'sam.taylor@example.com', '7 Spruce St, London','1996-05-16', 2, 4),
(8, 'Tina Scott', '2345678908', 'tina.scott@example.com', '8 Fir St, London','1987-06-21', 1, 4),
(9, 'Ursula King', '2345678909', 'ursula.king@example.com', '9 Willow St, London','1998-07-09', 2, 1),
(10, 'Victor Lee', '2345678910', 'victor.lee@example.com', '10 Poplar St, Manchester','1999-08-05', 2, 3),
(11, 'Wendy Harris', '2345678911', 'wendy.harris@example.com', '11 Redwood St, London','2000-09-26', 3, 4),
(12, 'Xander Young', '2345678912', 'xander.young@example.com', '12 Cypress St, Manchester','2001-10-11', 3, 3),
(13, 'Rachel Lewis', '3234567892', 'rachel.lewis@example.com', '13 Poplar Street, London','2000-11-28', 2, 2),
(14, 'Steven Moore', '3234567893', 'steven.moore@example.com', '14 Cypress Street, London','1999-12-30', 2, 4),
(15, 'Tina Nelson', '3234567894', 'tina.nelson@example.com', '15 Dogwood Street, London','2002-01-08', 3, 2),
(16, 'Ulysses Parker', '3234567895', 'ulysses.parker@example.com', '16 Hemlock Street, London','2000-02-15', 3, 1);

SELECT * FROM staff;



-- Insert Into Service table
INSERT INTO service VALUES
(1, 'Regular Cleaning', 200.00, 'Regular Cleaning consists of  Dusting, vacuuming, mopping floors, cleaning bathrooms and kitchens, taking out trash, and general tidying up.'),
(2, 'Deep Cleaning', 350.00, 'Deep Cleaning is more thorough than regular cleaning, including cleaning behind appliances, scrubbing grout, washing baseboards, and deep-cleaning carpets'),
(3, 'Move-In/Move-Out Cleaning', 400.00, 'Comprehensive cleaning of the entire property, including inside cabinets and closets, and ensuring the home is ready for new occupants.'),
(4, 'Sanitization and Disinfection', 300.00, 'Disinfecting high-touch surfaces, using EPA-approved disinfectants to eliminate bacteria and viruses.');

SELECT * FROM service;

-- Insert Into schedule table
 INSERT INTO schedule VALUES
 (1, 'Monday', '9 AM to 4 PM'),
 (2, 'Tuesday', '9 AM to 4 PM'),
 (3, 'Wednesday', '9 AM to 4 PM'),
 (4, 'Thursday', '9 AM to 4 PM'),
 (5, 'Friday', '9 AM to 4 PM'),
 (6, 'Saturday', '9 AM to 4 PM'),
 (7, 'Sunday', '9 AM to 4 PM');
 
SELECT * FROM schedule;


-- Insert Into promotion table
 INSERT INTO promotion VALUES
 ('PRO5', '5% DISCOUNT', 'This promotion reduce 5% of total amount.'),
 ('PRO10', '10% DISCOUNT', 'This promotion reduce 10% of total amount.');


SELECT * FROM promotion;


-- Insert Into booking tables
INSERT INTO booking VALUES
(1, '2024-01-01', '2024-01-05', '123 Elm St', 'London', 200.00, 190.00, 1, 1, 'PRO5'),
(2, '2024-01-02', '2024-01-06', '456 Maple St', 'Manchester', 350.00, 350.00, 3, 2, NULL ),
(3, '2024-01-03', '2024-01-07', '789 Oak St', 'London', 400.00, 380.00, 2, 3, 'PRO10'),
(4, '2024-01-04', '2024-01-08', '101 Pine St', 'Manchester', 300.00, 300.00, 3, 4,NULL ),
(5, '2024-01-05', '2024-01-09', '102 Cedar St', 'London', 650.00, 585.00, 4, 5, 'PRO10'),
(6, '2024-01-05', '2024-01-10', '103 Birch St', 'London', 500.00, 475.00, 1, 6, 'PRO5'),
(7, '2024-01-05', '2024-02-12', '104 Spruce St', 'London', 350.00, 350.00, 4, 7,NULL ),
(8, '2024-01-08', '2024-01-12', '105 Fir St', 'London', 200.00, 200.00, 2, 8,NULL ),
(9, '2024-01-08', '2024-01-13', '106 Willow St', 'London', 300.00, 300.00, 1, 9,NULL ),
(10, '2024-01-10', '2024-01-14', '107 Poplar St', 'Manchester', 400.00, 400.00, 3, 10, NULL),
(11, '2024-01-21', '2024-02-4', '108 Redwood St', 'Manchester', 400.00, 380.00, 3, 2, 'PRO5'),
(12, '2024-01-25', '2024-02-7', '109 Cypress St', 'Manchester', 350.00, 332.50, 3, 4, 'PRO5'),
(13, '2024-02-2', '2024-02-17', '110 Ash St', 'London', 200.00, 200.00, 2, 7,NULL ),
(14, '2024-02-5', '2024-02-19', '111 Elm St', 'London', 200.00, 200.00, 4, 6,NULL ),
(15, '2024-02-6', '2024-02-19', '112 Maple St', 'London', 350.00, 332.50, 2, 9, 'PRO5');
SELECT * FROM booking;

-- Insert Into Payment Table
INSERT INTO Payment VALUES
(1, 'Bank Transfer', '2024-01-01', 190.00, 1),
(2, 'Cash', '2024-01-02', 350.00, 2),
(3, 'Cash', '2024-01-03', 380.00, 3),
(4, 'Bank Transfer', '2024-01-04', 300.00, 4),
(5, 'Bank Transfer', '2024-01-05', 585.00, 5),
(6, 'Cash', '2024-01-05', 475.00, 6),
(7, 'Bank Transfer', '2024-01-05', 350.00, 7),
(8, 'Bank Transfer', '2024-01-08', 200.00, 8),
(9, 'Cash', '2024-01-08', 300.00, 9),
(10, 'Bank Transfer', '2024-01-10', 400.00, 10),
(11, 'Bank Transfer', '2024-01-21', 380.00, 11),
(12, 'Cash', '2024-01-25', 332.50, 12),
(13, 'Bank Transfer', '2024-02-2', 200.00, 13),
(14, 'Bank Transfer', '2024-02-5', 200.00, 14),
(15, 'Cash', '2024-02-6', 332.50, 15);
SELECT * FROM payment;

-- Insert Into Booking_Service table
INSERT INTO booking_service VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 2),
(5, 4),
(6, 1),
(6, 4),
(7, 2),
(8, 1),
(9, 4),
(10, 3),
(11, 3),
(12, 2),
(13, 1),
(14, 1),
(15, 2);
SELECT * FROM booking_service;


-- Insert into team schedule table
INSERT INTO team_schedule VALUES
(1, 3), (1, 4), (1, 5), (1, 6),
(2, 3), (2, 5), (2, 6), (2, 7),
(3, 1), (3, 2), (3, 3), (3, 6), (3, 7),
(4, 1), (4, 2), (4, 3), (4, 5);

SELECT * FROM team_schedule;

-- SELECT QUERIES

-- 1. select booking with cash payment between 2024-01-01 and 2024-01-16
SELECT b.booking_id, b.booking_date, b.service_date,b.booking_address ,b.total, p.payment_type, c.customer_id, c.customer_name, c.customer_phnum
FROM booking b, customer c, payment p
WHERE b.customer_id = c.customer_id
AND b.booking_id = p.booking_id
AND b.booking_date BETWEEN '2024-01-01' AND '2024-01-16'
AND p.payment_type = 'Cash'; 


-- 2. select customers with more than 1 booking and their total amount
SELECT c.customer_id, c.customer_name, c.customer_phnum, c.customer_email, count(b.booking_id) as 'Num of Booking', SUM(b.total)
FROM customer c, booking b
WHERE c.customer_id = b.customer_id
GROUP BY c.customer_id
HAVING count(b.booking_id) > 1; 





-- 3. select booking and its customer with maximum total amount
SELECT b.booking_id, b.booking_date, b.service_date, b.booking_address, b.booking_city, c.customer_id, c.customer_name, c.customer_phnum, c.customer_email
FROM booking b, customer c
WHERE b.customer_id = c.customer_id
AND b.total = (SELECT MAX(total) FROM booking);






-- 4. select teams that work on saturday or sunday and from london
SELECT t.*
FROM team t, team_schedule ts, schedule s
WHERE t.team_id = ts.team_id 
AND ts.schedule_id = s.schedule_id
AND t.team_city = 'London'
AND s.schedule_day = 'Saturday' OR 'Sunday';




-- 5. select bookings with more than 1 service
SELECT b.*, COUNT(bs.service_id) AS 'Num_of_Service'
FROM booking b, booking_service bs
WHERE b.booking_id = bs.booking_id
GROUP BY b.booking_id
HAVING COUNT(bs.service_id) > 1;






-- 6. select booking that order 'Sanitization and Disinfection' 
SELECT b.booking_id, b.booking_date, b.service_date, b.booking_address, b.booking_city, b.team_id
FROM booking b, booking_service bs, service s
WHERE b.booking_id = bs.booking_id
AND bs.service_id = s.service_id
AND s.service_name = 'Sanitization and Disinfection'
ORDER BY team_id;




-- 7. select 'Junior' staff with their respective team name and city
SELECT s.staff_id, s.staff_name, s.staff_phnum, s.staff_email, st.staff_type, t.team_id, t.team_name, t.team_city
FROM staff_type st, staff s, team t
WHERE st.staff_type_id = s.staff_type_id
AND t.team_id = s.team_id
AND st.staff_type = 'Junior'
ORDER BY t.team_id;




-- 8. select booking with promotions
SELECT b.booking_id,b.booking_date, b.service_date, b.booking_city, b.sub_total, b.total , p.promotion_name, p.promotion_desc
FROM booking b, promotion p
WHERE b.promotion_id = p.promotion_id
AND b.promotion_id is not null
ORDER BY b.service_date;





-- 9. select customers who are over 30 and live in London with their total spending
SELECT c.*, SUM(b.total) AS Total_Spending
FROM customer c, booking b
WHERE c.customer_id = b.customer_id
AND c.customer_dob < '1994-01-01'
AND c.customer_city = 'London'
GROUP BY c.customer_id
ORDER BY Total_Spending
DESC;




-- 10. select total money received from each service
SELECT s.service_id, s.service_name,
 SUM(CASE 
       WHEN b.promotion_id = 1 THEN s.price * 0.95
       WHEN b.promotion_id = 2 THEN s.price * 0.9 
       ELSE s.price 
       END) AS total_price,
COUNT(b.booking_id) as 'Num_of_Booking'
FROM service s, booking_service bs, booking b
WHERE s.service_id = bs.service_id
AND bs.booking_id = b.booking_id
GROUP BY s.service_id
ORDER BY total_price DESC;







