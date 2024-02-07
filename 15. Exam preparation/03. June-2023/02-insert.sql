INSERT INTO courses(name , duration_hours , start_date , teacher_name , description, university_id )
SELECT 
CONCAT(c.teacher_name,' ','course') AS name,
LENGTH(c.name) / 10 AS duration_hours,
DATE_ADD(c.start_date, INTERVAL 5 DAY) AS start_date,
REVERSE(c.teacher_name) AS teacher_name,
CONCAT('Course ',c.teacher_name, REVERSE(c.description)) AS description,
DAY(c.start_date) AS university_id
FROM courses c
WHERE c.id <= 5;

SELECT * FROM courses;