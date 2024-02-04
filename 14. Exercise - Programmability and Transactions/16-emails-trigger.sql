CREATE TABLE logs(
	log_id INT PRIMARY KEY AUTO_INCREMENT,
	account_id INT NOT NULL,
    old_sum DECIMAL(19,4),
    NEW_sum DECIMAL(19,4)
);

CREATE TABLE notification_emails(
	id INT PRIMARY KEY AUTO_INCREMENT,
    recipient INT NOT NULL,
    subject VARCHAR(2000),
    body TEXT
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

CREATE TRIGGER tr_insert
AFTER INSERT 
ON logs
FOR EACH ROW
BEGIN
	INSERT INTO notification_emails(recipient, subject, body)
    VALUES(
			new.account_id,
			CONCAT('Balance change for account: ', new.account_id), 
			CONCAT('On', DATE_FORMAT(NOW(), '%b %d %Y at %r'), ' your balance was changed from ',
            ROUND(new.old_sum,0), ' to ', ROUND(new.new_sum,0), '.')
            );
END $


DELIMITER ;