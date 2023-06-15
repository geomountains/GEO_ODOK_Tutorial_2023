SELECT 
    INITCAP(LOWER(river_basi)) AS name,
    sea AS sea,
    ST_Area(ST_Intersection(geom, {geom})::geography) AS intersect_area,
    (100 * (ST_Area(ST_Intersection(geom, {geom})::geography) / ST_Area({geom}::geography)))::integer AS intersect_percent,
    ST_Intersection(geom, {geom}) as geom
FROM 
    grdc_river_basins.major_river_basins 
WHERE 
    ST_Intersects(geom, {geom}) 
ORDER BY 
    intersect_area DESC 
LIMIT 
    500;