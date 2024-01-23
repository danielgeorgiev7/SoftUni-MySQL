SELECT department_id, COUNT(id) As 'Number of employees'
FROM employees
GROUP BY department_id;