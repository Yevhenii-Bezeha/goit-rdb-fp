DELIMITER $$
CREATE FUNCTION YearsDifference(year INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE start_date DATE;
    DECLARE years_difference INT;
    SET start_date = CONCAT(year, '-01-01');
    SET years_difference = TIMESTAMPDIFF(YEAR, start_date, CURDATE());
    RETURN years_difference;
END$$
DELIMITER ;

SELECT 
    entity_code_id, 
    Year, 
    Number_rabies,
    YearsDifference(Year) AS YearsDifference
FROM 
    Normalized_Infectious_Cases
WHERE 
    Number_rabies IS NOT NULL AND Number_rabies <> '';