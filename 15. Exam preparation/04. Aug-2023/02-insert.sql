INSERT INTO 
property_transactions(property_id , buyer_id , transaction_date , bank_name , iban, is_successful )
SELECT
	po.agent_id + DAY(po.offer_datetime) AS property_id,
	po.agent_id + MONTH(po.offer_datetime) AS buyer_id,
    DATE(po.offer_datetime) AS transaction_date,
    CONCAT('Bank ', po.agent_id) AS bank_name,
    CONCAT('BG', po.price, po.agent_id) AS iban,
    1 AS is_successful
FROM property_offers po
WHERE po.agent_id <= 2;
