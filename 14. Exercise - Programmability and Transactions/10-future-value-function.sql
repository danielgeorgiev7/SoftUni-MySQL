DELIMITER $

CREATE FUNCTION ufn_calculate_future_value(initial DECIMAL(19,4), interest_rate DOUBLE, num_years INT)
RETURNS DECIMAL(19,4)
DETERMINISTIC
BEGIN 
	RETURN initial * POW(1 + interest_rate, num_years);
END $

DELIMITER ;

SELECT ufn_calculate_future_value(1000, 0.5,5);