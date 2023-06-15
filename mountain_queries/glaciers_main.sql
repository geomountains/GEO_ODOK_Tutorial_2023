SELECT 
    INITCAP("glac_name") as "name",
    max("db_area") AS "area_",
    max("anlys_time") AS "ts",
    ST_Centroid(ST_Collect("geom")) AS "geom",
    ST_Area(ST_Union(ST_MakeValid("geom"))::geography) AS "area"
FROM 
    glims.glims_glacier_polygons
WHERE 
    ST_Intersects(geom, {geom}) AND 
    "glac_name" != '' AND 
    "glac_name" != 'None' 
GROUP BY "glac_name" 
ORDER BY "area_" DESC 
LIMIT 10;