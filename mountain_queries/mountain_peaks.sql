-- Listst the 25 highest mountain peaks in the range based on geonames data.
SELECT 
    name,
    elevation,
    geom 
FROM 
    geonames.geoname
WHERE 
    fcode = 'MT' AND 
    elevation IS NOT NULL AND 
    ST_Within(geom, {geom})
ORDER BY 
    elevation DESC 
LIMIT 
    25