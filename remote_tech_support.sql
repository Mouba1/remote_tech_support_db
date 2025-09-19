CREATE DATABASE IF NOT EXISTS Remote_Tech_Support;
USE Remote_Tech_Support;   


CREATE TABLE Customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    PRIMARY KEY (customer_id)
);


CREATE TABLE Technicians (
    technician_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20),
    PRIMARY KEY (technician_id)    
);


CREATE TABLE Devices (
    device_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    device_type VARCHAR(50) NOT NULL,
    brand VARCHAR(50),
    model VARCHAR(50),
    serial_number VARCHAR(100) UNIQUE,
    PRIMARY KEY (device_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
);


CREATE TABLE Tickets (
    ticket_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    technician_id INT,
    issue_description TEXT NOT NULL,
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ticket_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (technician_id) REFERENCES Technicians(technician_id)
);
CREATE TABLE ServiceLogs (
    log_id INT NOT NULL AUTO_INCREMENT,
    ticket_id INT NOT NULL,
    technician_id INT NOT NULL,
    service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolution_notes TEXT,
    PRIMARY KEY (log_id),
    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id),
    FOREIGN KEY (technician_id) REFERENCES Technicians(technician_id)
);

INSERT INTO Customers (name, email, phone, address) VALUES
('John Doe', 'john_d2025@gmail.com', '929-555-4010', '100 Main St, Bronx'),
('Mary Smith', 'marys2025@gmail.com', '929-555-4011', '200 Broad St, Queens'),
('Ali Hassan', 'alih2025@gmail.com', '929-555-4012', '300 Ocean Ave, Brooklyn');

INSERT INTO Technicians (name, email, specialization, phone) VALUES
('Liam Brown', 'liamb2025@yahoo.com', 'Networking', '917-555-5010'),
('Emma Davis', 'emmad2025@yahoo.com', 'Hardware', '917-555-5011'),
('Noah Wilson', 'noahw2025@yahoo.com', 'Software', '917-555-5012');

INSERT INTO Devices (customer_id, device_type, brand, model, serial_number) VALUES
(1, 'Laptop', 'Lenovo', 'ThinkPad T14', 'SN2025001'),
(2, 'Tablet', 'Apple', 'iPad Air', 'SN2025002'),
(3, 'Phone', 'Google', 'Pixel 8', 'SN2025003');

INSERT INTO Tickets (device_id, technician_id, issue_description, status) VALUES
(1, 1, 'Wi-Fi not connecting properly', 'Open'),
(2, 2, 'Computer won’t boot', 'In Progress'),
(3, 3, 'Phone screen flickering', 'Closed');


INSERT INTO ServiceLogs (ticket_id, service_date, notes) VALUES
(1, '2025-09-15', 'Checked drivers, issue with network card'),
(2, '2025-09-16', 'Replaced faulty power supply'),
(3, '2025-09-17', 'Screen replaced under warranty');

select * from customers;
select * from technicians;
select * from devices;
select * from tickets;
select * from servicelogs;





