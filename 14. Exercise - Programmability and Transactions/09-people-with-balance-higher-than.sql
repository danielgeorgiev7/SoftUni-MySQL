DELIMITER $

CREATE PROCEDURE usp_get_holders_with_balance_higher_than(target_salary DECIMAL(19,4))
BEGIN 
	SELECT first_name, last_name FROM account_holders ah
    JOIN accounts a ON ah.id = a.account_holder_id
    WHERE target_salary < (SELECT SUM(balance) FROM accounts
						   WHERE account_holder_id = ah.id)
	GROUP BY ah.id
	ORDER BY ah.id;
END $

DELIMITER ;

CALL usp_get_holders_with_balance_higher_than(1000);
