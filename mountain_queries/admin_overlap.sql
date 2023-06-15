SELECT 
    gid_0,
    name_0 as name,
    ST_Area(ST_Intersection(geom, {geom})::geography) AS intersect_area,
    (100 * (ST_Area(ST_Intersection(geom, {geom})::geography) / ST_Area({geom}::geography)))::integer AS intersect_percent,
    ST_Intersection(geom, {geom}) as geom
FROM 
    gadm.level0
WHERE 
    ST_Intersects(geom, {geom})
ORDER BY 
    intersect_percent DESC
LIMIT 
    100;