SELECT town_id, name FROM towns
WHERE LEFT(NAME,1) IN('M','K','B','E')
ORDER BY name;