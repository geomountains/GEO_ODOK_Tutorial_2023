SELECT 
    "Name" as name,
    "Category" as category,
    "geom" as geom
FROM 
    geo_mountains.in_situ_inventory_v2 
WHERE 
    ST_Within(geom, {geom})