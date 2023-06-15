SELECT 
    geom as geom
FROM 
    protected_areas.wdpa_polygons 
WHERE 
    ST_Intersects(geom, {geom}) AND 
    "MARINE" = '0' 

