SELECT CONCAT(a.first_name,' ',a.last_name) AS full_name,
		CONCAT(REVERSE(a.last_name),LENGTH(a.last_name),'@cast.com') AS email,
        2022-YEAR(a.birthdate) AS age, 
        height
FROM actors a
LEFT JOIN movies_actors ma ON a.id = ma.actor_id
WHERE ma.movie_id IS NULL
ORDER BY height;