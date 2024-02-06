INSERT INTO actors(first_name, last_name, birthdate, height, awards, country_id)
SELECT 
REVERSE(a.first_name) AS first_name, 
REVERSE(a.last_name) AS last_name, 
DATE_SUB(a.birthdate, INTERVAL 2 DAY) AS birthdate,
a.height + 10 AS height,
country_id AS awards,
(SELECT id FROM countries WHERE name = 'Armenia') AS country_id
FROM actors a
WHERE a.id <= 10;