CREATE TABLE deleted_employees(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(20),
    middle_name VARCHAR(50),
    job_title VARCHAR(50),
    department_id INT,
    salary DOUBLE
);

CREATE TRIGGER delete_employees_trigger
AFTER DELETE 
ON employees
FOR EACH ROW 
	INSERT INTO deleted_employees(first_name, last_name, middle_name,
									job_title, department_id, salary)
	VALUE (OLD.first_name, OLD.last_name, OLD.middle_name, OLD.job_title, OLD.department_id, salary);

    