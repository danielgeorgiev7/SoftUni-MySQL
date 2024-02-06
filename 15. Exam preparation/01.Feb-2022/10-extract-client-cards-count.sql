DELIMITER $

CREATE FUNCTION udf_customer_products_count(name VARCHAR(30)) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE count_result INT;
    
	SELECT COUNT(*) INTO count_result
	FROM customers c
	JOIN orders o ON o.customer_id = c.id
	JOIN orders_products op ON op.order_id = o.id
	WHERE first_name = name
	GROUP BY c.id;
    
    RETURN count_result;
END $

SELECT c.first_name,c.last_name, udf_customer_products_count('Shirley') as `total_products` FROM customers c
WHERE c.first_name = 'Shirley';