SELECT town_id, name FROM towns
WHERE LEFT(NAME,1) NOT IN('R','B','D')
ORDER BY name;