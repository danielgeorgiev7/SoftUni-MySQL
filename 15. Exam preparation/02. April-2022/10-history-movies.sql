DELIMITER $

CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE result INT;
    
	SELECT COUNT(*) INTO result
	FROM movies m
	JOIN genres_movies gm ON gm.movie_id = m.id
	JOIN genres g ON gm.genre_id = g.id
	JOIN movies_actors ma ON ma.movie_id = m.id
	JOIN actors a ON ma.actor_id = a.id
	WHERE g.name = 'History' AND CONCAT(a.first_name,' ',a.last_name) = full_name;
    
    RETURN result;
END $

DELIMITER ;

SELECT udf_actor_history_movies_count('Jared Di Batista');

