UPDATE products p
SET p.quantity_in_stock = p.quantity_in_stock - 5
WHERE p.quantity_in_stock BETWEEN 60 AND 70;