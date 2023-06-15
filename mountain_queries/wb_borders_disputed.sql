SELECT 
    ST_Union(geom) AS geom 
FROM 
    worldbank_boundaries.wb_admin0_disputed_areas_boundary_lines
WHERE 
    ST_Intersects(geom, ST_Envelope(ST_Buffer({extent},1.0)))