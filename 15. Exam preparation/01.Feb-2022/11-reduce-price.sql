DELIMITER $

CREATE PROCEDURE udp_reduce_price (category_name VARCHAR(50))
BEGIN
	UPDATE products p
	JOIN categories c ON c.id = p.category_id
	JOIN reviews r ON r.id = p.review_id
	SET price = price * 0.7
	WHERE c.name = category_name AND r.rating < 4;
END $

CALL udp_reduce_price ('Phones and tablets');
SELECT * FROM products p WHERE p.category_id = 1;