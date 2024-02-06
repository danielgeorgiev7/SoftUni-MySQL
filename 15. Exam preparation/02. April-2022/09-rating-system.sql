SELECT m.title,
 IF(mai.rating <= 4,'poor',IF(mai.rating <=7,'good','excellent')) AS rating,
 IF(mai.has_subtitles = 1,'english','-') AS subtitles,
 mai.budget 
FROM movies m
JOIN movies_additional_info mai ON mai.id = m.movie_info_id
ORDER BY budget DESC;
