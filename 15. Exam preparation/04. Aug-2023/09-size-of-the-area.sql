SELECT 
	address, area,
	IF(area <= 100,'small',
		IF(area <= 200,'medium',
			IF(area <= 500,'large','extra large')))
				AS size
FROM properties
ORDER BY area,address DESC;