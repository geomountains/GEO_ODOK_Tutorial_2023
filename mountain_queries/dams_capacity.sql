SELECT 
    SUM(area_skm) AS total_area,
    SUM(cap_mcm) AS cap_mcm
FROM 
    global_damwatch.grand 
WHERE 
    ST_Within(geom, {geom}) 