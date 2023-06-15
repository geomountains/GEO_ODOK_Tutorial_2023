SELECT 
    geom as geom
FROM 
    protected_areas.wdpa_polygons 
WHERE 
    ST_Intersects(geom, {geom}) AND 
    ("IUCN_CAT" = 'Ia' OR "IUCN_CAT" = 'Ib') AND 
    "MARINE" = '0' 