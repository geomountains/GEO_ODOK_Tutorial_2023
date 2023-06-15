SELECT 
    "geom" AS "geom" 
FROM 
    randolph_glacier_outlines.randolph_glacier_outlines 
WHERE 
    ST_Intersects(geom, ST_GeomFromText('POLYGON((7.646001,45.903452,7.893880,46.019439))', 4326)) 
