SELECT 
    COUNT(*) as num_dams,
    main_use
FROM 
    global_damwatch.grand 
WHERE 
    ST_Within(geom, {geom}) 
GROUP BY 
    main_use 
ORDER BY 
    num_dams DESC
