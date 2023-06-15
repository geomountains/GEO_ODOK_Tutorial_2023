WITH basins AS (
    SELECT 
        ST_Union(ST_Intersection(geom, ST_Envelope(ST_Buffer({extent},1.0)))) as geom
    FROM 
        grdc_river_basins.major_river_basins 
    WHERE 
        ST_Intersects(geom, {geom})
)
SELECT 
    strahler,
    ST_SimplifyPreserveTopology(fao_major_rivers.geom, 0.01) AS geom
FROM 
    fao_river_basins.fao_major_rivers
JOIN 
    basins ON ST_Intersects(basins.geom, fao_major_rivers.geom)