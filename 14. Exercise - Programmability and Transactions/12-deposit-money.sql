DELIMITER $

CREATE PROCEDURE usp_deposit_money(acc_id INT, money_amount DECIMAL(10,4))
BEGIN
	START TRANSACTION;
    IF ((SELECT COUNT(*) FROM accounts WHERE id = acc_id) <> 1 OR money_amount < 0)
		THEN ROLLBACK;
	ELSE 
		UPDATE accounts SET balance = balance + money_amount WHERE id = acc_id;
	END IF;
END $
