CREATE DATABASE soft_uni;
USE soft_uni;

CREATE TABLE towns(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
name VARCHAR(20) NOT NULL
);

CREATE TABLE addresses(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
address_text VARCHAR(100) NOT NULL,
town_id INT UNSIGNED NOT NULL,

CONSTRAINT fk_address_town FOREIGN KEY (town_id) REFERENCES towns(id)
);

CREATE TABLE departments(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
name VARCHAR(20) NOT NULL
);

CREATE TABLE employees(
id INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
middle_name VARCHAR(20),
last_name VARCHAR(20) NOT NULL,
job_title VARCHAR(20) NOT NULL,
department_id INT UNSIGNED NOT NULL,
hire_date DATE NOT NULL,
salary DOUBLE UNSIGNED NOT NULL,
address_id INT UNSIGNED NOT NULL,

CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES departments(id),
CONSTRAINT fk_employee_address FOREIGN KEY (address_id) REFERENCES addresses(id)
);

INSERT INTO towns (name) VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO departments (name) VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO addresses (address_text, town_id) VALUES
('123 Main St, Sofia', 1),
('456 Oak St, Plovdiv', 2),
('789 Pine St, Varna', 3),
('101 Elm St, Burgas', 4);

INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary, address_id) VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00, 1),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00, 2),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25, 3),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00, 4),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88, 2);



