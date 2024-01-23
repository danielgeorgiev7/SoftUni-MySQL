SELECT department_id, MIN(salary) AS 'MinSalary'
FROM employees
GROUP BY department_id
HAVING `MinSalary` > 800;