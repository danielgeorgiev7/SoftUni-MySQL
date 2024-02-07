SELECT u.name AS university_name,
		c.name AS city_name,
        u.address,
         IF(u.tuition_fee < 800,'cheap',
			IF(u.tuition_fee < 1200,'normal',
				IF(u.tuition_fee < 2500,'high','expensive')))
					AS price_rank,
        u.tuition_fee
FROM universities u
JOIN cities c ON c.id = u.city_id
ORDER BY tuition_fee;