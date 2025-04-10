CREATE DATABASE GetRail;
USE GetRail;

-- Passenger Table
CREATE TABLE Passenger (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_no VARCHAR(20),
    age INT NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    authentication_proof VARCHAR(255)
);

-- Payment Table
CREATE TABLE Payment (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    mode VARCHAR(50) NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id) ON DELETE CASCADE
);

-- Ticket Table
CREATE TABLE Ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    train_no INT,
    ticket_class VARCHAR(50),
    seat_no VARCHAR(10),
    date DATE,
    reservation_status ENUM('Reserved', 'RAC', 'Waiting'),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id) ON DELETE CASCADE,
    FOREIGN KEY (train_no) REFERENCES TrainDetails(train_no) ON DELETE CASCADE
);

-- Train Details Table
CREATE TABLE TrainDetails (
    train_no INT AUTO_INCREMENT PRIMARY KEY,
    train_name VARCHAR(255) NOT NULL,
    compartment VARCHAR(50),
    train_source VARCHAR(255) NOT NULL,
    train_destination VARCHAR(255) NOT NULL
);

-- Technical Supervisor Table
CREATE TABLE TechnicalSupervisor (
    supervisor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_no VARCHAR(20),
    email VARCHAR(255) UNIQUE
);

-- Relationship Table for Train Management by Supervisors
CREATE TABLE TrainManagement (
    train_no INT,
    supervisor_id INT,
    PRIMARY KEY (train_no, supervisor_id),
    FOREIGN KEY (train_no) REFERENCES TrainDetails(train_no) ON DELETE CASCADE,
    FOREIGN KEY (supervisor_id) REFERENCES TechnicalSupervisor(supervisor_id) ON DELETE CASCADE
);
-- Insert into Passenger table (15 values)
INSERT INTO Passenger (name, phone_no, age, gender, authentication_proof) VALUES
('Yash Bhavsar', '9876543210', 28, 'Male', 'AADHAAR_1234'),
('Ramesh Chaudhary', '9876543211', 45, 'Male', 'PAN_5678'),
('Priya Sharma', '9876543212', 32, 'Female', 'AADHAAR_2345'),
('Anjali Verma', '9876543213', 26, 'Female', 'VOTERID_6789'),
('Amit Patel', '9876543214', 39, 'Male', 'AADHAAR_3456'),
('Suresh Yadav', '9876543215', 50, 'Male', 'PAN_7890'),
('Kiran Mehta', '9876543216', 29, 'Female', 'AADHAAR_4567'),
('Deepak Nair', '9876543217', 42, 'Male', 'DRIVING_LICENSE_8901'),
('Neha Saxena', '9876543218', 27, 'Female', 'AADHAAR_5678'),
('Vikas Gupta', '9876543219', 33, 'Male', 'VOTERID_9012'),
('Pooja Rao', '9876543220', 31, 'Female', 'PAN_6789'),
('Manoj Tiwari', '9876543221', 41, 'Male', 'AADHAAR_6789'),
('Rekha Iyer', '9876543222', 36, 'Female', 'DRIVING_LICENSE_2345'),
('Arun Desai', '9876543223', 47, 'Male', 'VOTERID_3456'),
('Simran Kaur', '9876543224', 30, 'Female', 'AADHAAR_7890');

-- Insert into TechnicalSupervisor table (8 values)
INSERT INTO TechnicalSupervisor (name, phone_no, email) VALUES
('Rajesh Kumar', '9876500011', 'rajesh.kumar@railway.in'),
('Alok Singh', '9876500012', 'alok.singh@railway.in'),
('Sanjay Gupta', '9876500013', 'sanjay.gupta@railway.in'),
('Ravi Shankar', '9876500014', 'ravi.shankar@railway.in'),
('Anita Joshi', '9876500015', 'anita.joshi@railway.in'),
('Kamal Nath', '9876500016', 'kamal.nath@railway.in'),
('Vandana Sharma', '9876500017', 'vandana.sharma@railway.in'),
('Mukesh Aggarwal', '9876500018', 'mukesh.aggarwal@railway.in');

-- Insert into TrainDetails table (5 values)
INSERT INTO TrainDetails (train_name, compartment, train_source, train_destination) VALUES
('Rajdhani Express', 'AC First Class', 'Delhi', 'Mumbai'),
('Shatabdi Express', 'AC Chair Car', 'Delhi', 'Chandigarh'),
('Duronto Express', 'Sleeper', 'Kolkata', 'Bangalore'),
('Garib Rath', 'AC Economy', 'Lucknow', 'Hyderabad'),
('Intercity Express', 'General', 'Pune', 'Goa');

-- Insert into TrainManagement table (mapping trains to supervisors)
INSERT INTO TrainManagement (train_no, supervisor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6),
(2, 7),
(3, 8);

-- Insert into Payment table (5 values)
INSERT INTO Payment (passenger_id, mode) VALUES
(1, 'Credit Card'),
(2, 'UPI'),
(3, 'Net Banking'),
(4, 'Debit Card'),
(5, 'Cash');

-- Insert into Ticket table (10 values)
INSERT INTO Ticket (passenger_id, train_no, ticket_class, seat_no, date, reservation_status) VALUES
(1, 1, 'AC First Class', 'A1-12', '2025-03-20', 'Reserved'),
(2, 2, 'AC Chair Car', 'C2-15', '2025-03-22', 'RAC'),
(3, 3, 'Sleeper', 'S3-42', '2025-03-25', 'Reserved'),
(4, 4, 'AC Economy', 'E1-5', '2025-03-28', 'Waiting'),
(5, 5, 'General', 'G5-20', '2025-04-01', 'Reserved'),
(6, 1, 'AC First Class', 'A2-8', '2025-04-05', 'Reserved'),
(7, 2, 'AC Chair Car', 'C3-10', '2025-04-08', 'RAC'),
(8, 3, 'Sleeper', 'S2-31', '2025-04-10', 'Waiting'),
(9, 4, 'AC Economy', 'E3-2', '2025-04-15', 'Reserved'),
(10, 5, 'General', 'G1-5', '2025-04-20', 'Reserved');

-- UPDATE: Correcting Passenger phone numbers and ages
UPDATE Passenger 
SET phone_no = '9876543299', age = 29
WHERE name = 'Yash Bhavsar';

UPDATE Passenger 
SET phone_no = '9876543225', age = 40
WHERE name = 'Simran Kaur';

-- UPDATE: Correcting Technical Supervisor email
UPDATE TechnicalSupervisor 
SET email = 'mukesh.a@railway.in'
WHERE name = 'Mukesh Aggarwal';

-- UPDATE: Fixing Ticket seat number and reservation status
UPDATE Ticket 
SET seat_no = 'S1-50', reservation_status = 'Reserved'
WHERE passenger_id = 8;

-- DELETE: Removing incorrect payment entry
DELETE FROM Payment 
WHERE passenger_id = 5;

-- DELETE: Removing incorrect Train Supervisor relationship
DELETE FROM TrainManagement 
WHERE train_no = 3 AND supervisor_id = 8;

-- INSERT: Adding a correct Passenger entry
INSERT INTO Passenger (name, phone_no, age, gender, authentication_proof) VALUES
('Rahul Nair', '9876500019', 34, 'Male', 'AADHAAR_1122');

-- INSERT: Adding a correct Payment entry
INSERT INTO Payment (passenger_id, mode) VALUES
(5, 'Credit Card');

-- INSERT: Adding a correct Train Supervisor relationship
INSERT INTO TrainManagement (train_no, supervisor_id) VALUES
(3, 7);
-- 1️⃣ Number Functions 

-- Find the Average Age of Passengers
SELECT AVG(age) AS Average_Age FROM Passenger;

-- Find the Total Number of Tickets Booked
SELECT COUNT(*) AS Total_Tickets FROM Ticket;

-- Find the Maximum and Minimum Age of Passengers
SELECT MAX(age) AS Oldest_Passenger, MIN(age) AS Youngest_Passenger FROM Passenger;

-- Round Off Salary of Technical Supervisors (if salary column exists)
SELECT name, ROUND(salary, 2) AS Rounded_Salary FROM TechnicalSupervisor;

-- Get the Total Revenue Collected from Payments (Assuming a Fare Column Exists)
SELECT SUM(fare) AS Total_Revenue FROM Payment;


-- 2️⃣ Character Functions 

-- Convert Passenger Names to Uppercase
SELECT UPPER(name) AS Upper_Name FROM Passenger;

-- Convert Supervisor Names to Lowercase
SELECT LOWER(name) AS Lower_Name FROM TechnicalSupervisor;

-- Extract First Three Letters of Passenger Names
SELECT LEFT(name, 3) AS Name_Prefix FROM Passenger;

-- Find Length of Passenger Names
SELECT name, LENGTH(name) AS Name_Length FROM Passenger;

-- Concatenate Passenger Name and Phone Number
SELECT CONCAT(name, ' - ', phone_no) AS Passenger_Info FROM Passenger;


-- 3️⃣ SELECT Queries

-- Get All Reserved Tickets
SELECT * FROM Ticket WHERE reservation_status = 'Reserved';

-- Get All Passengers Whose Name Starts with 'A'
SELECT * FROM Passenger WHERE name LIKE 'A%';

-- Find All Trains Going to Mumbai
SELECT * FROM TrainDetails WHERE train_destination = 'Mumbai';

-- Find Supervisors Assigned to Train No. 1
SELECT TechnicalSupervisor.* 
FROM TechnicalSupervisor
JOIN TrainManagement ON TechnicalSupervisor.supervisor_id = TrainManagement.supervisor_id
WHERE TrainManagement.train_no = 1;

-- List Passengers Aged Between 25 and 40
SELECT * FROM Passenger WHERE age BETWEEN 25 AND 40;

-- INNER JOIN
SELECT p.passenger_id, p.name AS passenger_name, t.ticket_id, t.train_no, tr.train_name
FROM Passenger p
INNER JOIN Ticket t ON p.passenger_id = t.passenger_id
INNER JOIN TrainDetails tr ON t.train_no = tr.train_no;

-- LEFT JOIN
SELECT p.passenger_id, p.name, t.ticket_id, t.train_no, tr.train_name
FROM Passenger p
LEFT JOIN Ticket t ON p.passenger_id = t.passenger_id
LEFT JOIN TrainDetails tr ON t.train_no = tr.train_no;

-- RIGHT JOIN
SELECT p.passenger_id, p.name , t.ticket_id, t.train_no, tr.train_name
FROM Passenger p
RIGHT JOIN Ticket t ON p.passenger_id = t.passenger_id
RIGHT JOIN TrainDetails tr ON t.train_no = tr.train_no;

-- FULL OUTER JOIN (using UNION for MySQL)
SELECT p.passenger_id, p.name, t.ticket_id, t.train_no, tr.train_name
FROM Passenger p
LEFT JOIN Ticket t ON p.passenger_id = t.passenger_id
LEFT JOIN TrainDetails tr ON t.train_no = tr.train_no
UNION
SELECT p.passenger_id, p.name , t.ticket_id, t.train_no, tr.train_name
FROM Passenger p
RIGHT JOIN Ticket t ON p.passenger_id = t.passenger_id
RIGHT JOIN TrainDetails tr ON t.train_no = tr.train_no;

-- CROSS JOIN
SELECT p.passenger_id, p.name, t.ticket_id, t.train_no, tr.train_name
FROM Passenger p
CROSS JOIN Ticket t
CROSS JOIN TrainDetails tr;

DELIMITER //

CREATE TRIGGER after_ticket_insert
AFTER INSERT ON Ticket
FOR EACH ROW
BEGIN
    INSERT INTO Payment (passenger_id, mode) 
    VALUES (NEW.passenger_id, 'Pending');
END;

//

DELIMITER ;
INSERT INTO Ticket (passenger_id, train_no, ticket_class, seat_no, date, reservation_status) 
VALUES (16, 6, 'AC Chair Car', 'C1-22', '2025-04-25', 'Reserved');

SELECT * FROM Payment WHERE passenger_id = 16;


