SELECT 
    entity_code_id, 
    AVG(Number_rabies) AS Average, 
    MIN(Number_rabies) AS Minimum, 
    MAX(Number_rabies) AS Maximum, 
    SUM(Number_rabies) AS Sum
FROM 
    Normalized_Infectious_Cases
WHERE 
    Number_rabies IS NOT NULL AND Number_rabies <> ''
GROUP BY 
    entity_code_id
ORDER BY 
    Average DESC
LIMIT 10;