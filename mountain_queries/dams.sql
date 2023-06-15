SELECT 
    geom 
FROM 
    global_damwatch.grand 
WHERE 
    ST_Within(geom, {geom})