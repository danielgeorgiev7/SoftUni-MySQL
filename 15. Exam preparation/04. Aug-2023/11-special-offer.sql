DELIMITER $

CREATE PROCEDURE udp_special_offer(first_name VARCHAR(50))
BEGIN
	UPDATE property_offers p
	JOIN agents a ON a.id = p.agent_id
	SET p.price = p.price * 0.9
	WHERE a.first_name = first_name;
END $

DELIMITER ;

CALL udp_special_offer('Hans');