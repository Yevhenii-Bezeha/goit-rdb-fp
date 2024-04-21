SELECT 
    entity_code_id, 
    CONCAT(Year, '-01-01') AS StartDate, 
    CURDATE() AS CurrentDate, 
    TIMESTAMPDIFF(YEAR, CONCAT(Year, '-01-01'), CURDATE()) AS YearsDifference
FROM 
    Normalized_Infectious_Cases;