SELECT category_id, ROUND(AVG(price),2) AS 'Average Price',
	ROUND(MIN(PRICE),2) AS 'Cheapest Product',
	ROUND(MAX(PRICE),2) 'Most Expensive Product'
FROM products
GROUP BY category_id;