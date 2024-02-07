DELIMITER $

CREATE FUNCTION udf_average_alumni_grade_by_course_name(course_name VARCHAR(60)) 
RETURNS DECIMAL(19,2)
DETERMINISTIC
BEGIN 
	DECLARE result DECIMAL(19,2);
    
	SELECT ROUND(AVG(sc.grade),2) INTO result
	FROM students_courses sc
	JOIN courses c ON sc.course_id = c.id
	JOIN students s ON s.id = sc.student_id
	WHERE c.name = course_name AND s.is_graduated = 1
	GROUP BY c.name;
    
    RETURN result;
END $

DELIMITER ;

SELECT c.name, udf_average_alumni_grade_by_course_name('Quantum Physics') as average_alumni_grade FROM courses c 
WHERE c.name = 'Quantum Physics';
