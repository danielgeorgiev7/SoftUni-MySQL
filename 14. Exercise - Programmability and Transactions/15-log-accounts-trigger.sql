CREATE TABLE logs(
	log_id INT PRIMARY KEY AUTO_INCREMENT,
	account_id INT NOT NULL,
    old_sum DECIMAL(19,4),
    NEW_sum DECIMAL(19,4)
);

DELIMITER $ 

CREATE TRIGGER tr_update
AFTER UPDATE 
ON accounts
FOR EACH ROW
BEGIN
	INSERT INTO logs(account_id, old_sum, new_sum)
    VALUES(old.id, old.balance, new.balance);
END $

DELIMITER ;