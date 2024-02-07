CREATE DATABASE universities_db;

USE universities_db;

CREATE TABLE countries(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) UNIQUE NOT NULL
); 

CREATE TABLE cities(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) UNIQUE NOT NULL,
    population INT,
    country_id INT NOT NULL, -- -- --
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE universities(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(60) UNIQUE NOT NULL,
    address VARCHAR(80) UNIQUE NOT NULL,
    tuition_fee DECIMAL(19,2) NOT NULL,
    number_of_staff INT,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE students(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
    age INT,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    is_graduated TINYINT(1) NOT NULL,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE courses(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) UNIQUE NOT NULL,
    duration_hours DECIMAL (19,2),
    start_date DATE,
    teacher_name VARCHAR(60) UNIQUE NOT NULL,
    description TEXT,
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(id)
);


CREATE TABLE students_courses(
	grade DECIMAL(19,2) NOT NULL,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
	FOREIGN KEY (student_id) REFERENCES students(id),
	FOREIGN KEY (course_id) REFERENCES courses(id)
);
