SELECT 
	(SELECT mountain_range FROM mountains WHERE id = p.mountain_id) AS 'mountain_range', 
    peak_name, 
    elevation 
FROM peaks AS p 
HAVING mountain_range = 'Rila'
ORDER BY elevation DESC;
