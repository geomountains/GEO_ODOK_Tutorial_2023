SELECT 
    grand_id,
    res_name,
    dam_name,
    river,
    area_skm,
    cap_mcm,
    main_use
FROM 
    global_damwatch.grand 
WHERE 
    ST_Within(geom, {geom}) 
ORDER BY 
    area_skm DESC, cap_mcm DESC