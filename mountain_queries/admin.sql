SELECT 
    ST_Union(ST_Intersection(geom, ST_Envelope(ST_Buffer({extent},2.0)))) as geom,
    name_ciawf as name
FROM 
    naturalearth.ne_10m_admin_0_countries
WHERE 
    ST_Intersects(geom, ST_Envelope(ST_Buffer({extent}, 1.0)))
GROUP BY 
    name_ciawf 
LIMIT 
    100