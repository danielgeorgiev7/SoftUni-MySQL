SELECT 
country_code ,
COUNT(mountain_id) AS mountain_range
FROM mountains_countries
WHERE country_code IN ('BG','RU','US')
GROUP BY country_code
ORDER BY mountain_range DESC;