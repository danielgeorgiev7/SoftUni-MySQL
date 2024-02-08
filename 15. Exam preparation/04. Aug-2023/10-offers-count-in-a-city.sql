DELIMITER $

CREATE FUNCTION udf_offers_from_city_name (city_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE result INT;
    
	SELECT COUNT(*) INTO result
	FROM property_offers po
	JOIN properties p ON p.id = po.property_id
	JOIN cities c ON c.id = p.city_id
	WHERE c.name = city_name
	GROUP BY c.id;
    
	RETURN result;
END $

DELIMITER ;

SELECT udf_offers_from_city_name('Vienna') AS offers_count;
