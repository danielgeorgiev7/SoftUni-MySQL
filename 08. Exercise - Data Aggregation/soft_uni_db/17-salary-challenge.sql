SELECT first_name, last_name, department_id 
FROM employees AS e
where salary > (SELECT avg(salary) FROM employees WHERE department_id = e.department_id)
ORDER BY department_id, employee_id
LIMIT 10;