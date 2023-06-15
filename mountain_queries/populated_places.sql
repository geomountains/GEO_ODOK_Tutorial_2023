-- Listst the 25 highest mountain peaks in the range based on geonames data.
SELECT 
    name,
    fcode,
    country, 
    elevation,
    population, 
    geom 
FROM 
    geonames.geoname
WHERE 
    (fcode = 'PPLA' OR fcode = 'PPLC' OR fcode = 'PPLA2') AND 
    population IS NOT NULL AND 
    ST_Within(geom, {geom})
ORDER BY 
    population DESC 
LIMIT 
    25