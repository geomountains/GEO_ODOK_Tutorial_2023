SELECT 
    ST_Union(ST_Intersection(geom, ST_Envelope(ST_Buffer({extent},-0.2)))) as geom,
    name_ciawf as name
FROM 
    naturalearth.ne_10m_admin_0_countries
WHERE 
    ST_Intersects(geom, ST_Envelope(ST_Buffer({extent}, 1.0))) AND 
    labelrank <= 6 
GROUP BY 
    name_ciawf, labelrank  
ORDER BY 
    labelrank DESC 
LIMIT 
    100
