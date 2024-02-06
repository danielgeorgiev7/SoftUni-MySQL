SELECT mai.id, title, runtime, budget, release_date 
FROM movies_additional_info mai
JOIN movies m ON m.movie_info_id = mai.id
WHERE YEAR(release_date) BETWEEN 1996 AND 1999
ORDER BY runtime, mai.id
LIMIT 20;
