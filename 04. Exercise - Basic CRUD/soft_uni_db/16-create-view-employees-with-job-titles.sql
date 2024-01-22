CREATE VIEW v_employees_job_titles AS 
SELECT CONCAT(first_name, ' ', IF(middle_name IS NULL, '', CONCAT(middle_name,' ')), last_name) AS 'full_name', job_title
FROM employees;

DROP VIEW v_employees_job_titles;

SELECT * FROM v_employees_job_titles;