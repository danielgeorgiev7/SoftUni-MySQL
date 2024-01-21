CREATE DATABASE car_rental;
USE car_rental;

CREATE TABLE categories(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
category VARCHAR(20) NOT NULL,
daily_rate INT NOT NULL,
weekly_rate INT NOT NULL,
monthly_rate INT NOT NULL,
weekend_rate INT NOT NULL
);

CREATE TABLE cars(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
plate_number VARCHAR(20) NOT NULL,
make VARCHAR(20) NOT NULL,
model VARCHAR(40) NOT NULL,
car_year YEAR NOT NULL,
category_id INT UNSIGNED NOT NULL,
doors INT,
picture BLOB,
car_condition ENUM('Excellent', 'Good', 'Fair', 'Poor'),
available BOOL
);

CREATE TABLE employees(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
title VARCHAR(20) NOT NULL,
notes TEXT
);

CREATE TABLE customers(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
driver_licence_number INT UNSIGNED NOT NULL,
full_name VARCHAR(20) NOT NULL,
address VARCHAR(40) NOT NULL,
city VARCHAR(20) NOT NULL,
zip_code INT UNSIGNED NOT NULL,
notes TEXT
);

CREATE TABLE rental_orders(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
employee_id INT UNSIGNED NOT NULL,
customer_id INT UNSIGNED NOT NULL,
car_id INT UNSIGNED NOT NULL,
car_condition VARCHAR(20),
tank_level DECIMAL,
kilometrage_start INT UNSIGNED NOT NULL,
kilometrage_end INT UNSIGNED NOT NULL,
total_kilometrage INT UNSIGNED NOT NULL,
start_date DATE,
end_date DATE,
total_days INT UNSIGNED,
rate_applied DOUBLE,
tax_rate DOUBLE,
order_status ENUM('Reserved', 'InProgress', 'Completed', 'Cancelled') NOT NULL,
notes TEXT
);

INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate, weekend_rate)
VALUES 
('Economy', 50, 300, 1200, 70),
('Standard', 70, 400, 1500, 90),
('Luxury', 100, 600, 2500, 120);

INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, car_condition, available)
VALUES
('ABC123', 'Toyota', 'Corolla', 2020, 1, 4, 'Excellent', true),
('XYZ789', 'Honda', 'Civic', 2019, 2, 4, 'Good', true),
('DEF456', 'BMW', 'X5', 2021, 3, 4, 'Excellent', true);

INSERT INTO employees (first_name, last_name, title, notes)
VALUES
('John', 'Doe', 'Manager', 'Responsible for overall operations'),
('Jane', 'Smith', 'Sales Representative', 'Handles customer inquiries'),
('Bob', 'Johnson', 'Mechanic', 'Performs maintenance and repairs');

INSERT INTO customers (driver_licence_number, full_name, address, city, zip_code, notes)
VALUES
(123456789, 'Alice Johnson', '123 Main St', 'Cityville', 56789, 'Frequent customer'),
(987654321, 'Bob Williams', '456 Oak St', 'Townsville', 12345, 'New customer'),
(555555555, 'Charlie Davis', '789 Pine St', 'Villagetown', 67890, 'Corporate account');

INSERT INTO rental_orders (employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes)
VALUES
(1, 1, 1, 'Excellent', 80.0, 5000, 5500, 500, '2024-01-01', '2024-01-05', 5, 50.0, 0.1, 'Completed', 'Smooth rental experience'),
(2, 2, 2, 'Good', 75.0, 6000, 6500, 500, '2024-02-01', '2024-02-04', 4, 70.0, 0.15, 'InProgress', 'Customer requested extension'),
(3, 3, 3, 'Excellent', 90.0, 7000, 7500, 500, '2024-03-01', '2024-03-03', 3, 100.0, 0.2, 'Reserved', 'Corporate rental');