SELECT 
    "NAME" AS name, 
    "DESIG_ENG" AS type,
    "IUCN_CAT" AS iucn_cat, 
    "GIS_AREA" as area,
    "REP_AREA" as reported_area,
    "geom" as geom
FROM 
    protected_areas.wdpa_polygons 
WHERE 
    ST_Intersects(geom, {geom}) AND 
    "MARINE" = '0'
ORDER BY "GIS_AREA" DESC LIMIT 10
