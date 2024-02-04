DELIMITER $ 

CREATE PROCEDURE usp_transfer_money(acc_id INT, target_id INT, money_amount DECIMAL(19,4))
BEGIN 
	START TRANSACTION;
    IF (
		(SELECT COUNT(*) FROM accounts WHERE id = acc_id) <> 1 OR
        (SELECT COUNT(*) FROM accounts WHERE id = target_id) <> 1 OR
        (SELECT balance FROM accounts WHERE id = acc_id) < money_amount OR money_amount < 0
        ) THEN
			ROLLBACK;
	ELSE 
		UPDATE accounts SET balance = balance - money_amount WHERE id = acc_id;
        UPDATE accounts SET balance = balance + money_amount WHERE id = target_id;
        COMMIT;
	END IF;
END $

DELIMITER ;

CALL usp_transfer_money(1, 2, 10);
SELECT * FROM accounts 
WHERE id IN (1,2)
ORDER BY id;