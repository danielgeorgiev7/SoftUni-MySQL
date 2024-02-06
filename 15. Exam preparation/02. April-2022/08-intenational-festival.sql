SELECT c.name, COUNT(c.id) AS movies_count
FROM movies m
JOIN countries c ON m.country_id = c.id
GROUP BY c.id
HAVING movies_count >= 7
ORDER BY c.name DESC;