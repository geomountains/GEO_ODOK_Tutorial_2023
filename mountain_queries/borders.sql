SELECT 
    ST_Union(geom) AS geom 
FROM 
    naturalearth.ne_10m_admin_0_boundary_lines_land
WHERE 
    ST_Intersects(geom, ST_Envelope(ST_Buffer({extent},1.0)))