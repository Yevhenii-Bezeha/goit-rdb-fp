CREATE TABLE Entity_Code(
    id INT AUTO_INCREMENT,
    Entity VARCHAR(255),
    Code VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO Entity_Code(Entity, Code)
SELECT DISTINCT Entity, Code 
FROM infectious_cases;

CREATE TABLE Normalized_Infectious_Cases(
    id INT AUTO_INCREMENT,
    entity_code_id INT NOT NULL,
    Year INT NULL,
    Number_yaws TEXT NULL,
    polio_cases INT NULL,
    cases_guinea_worm INT NULL,
    Number_rabies TEXT NULL,
    Number_malaria TEXT NULL,
    Number_hiv TEXT NULL,
    Number_tuberculosis TEXT NULL,
    Number_smallpox TEXT NULL,
    Number_cholera_cases TEXT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (entity_code_id) REFERENCES Entity_Code(id)
);

INSERT INTO Normalized_Infectious_Cases(entity_code_id, Year, Number_yaws, polio_cases, cases_guinea_worm, Number_rabies, Number_malaria, Number_hiv, Number_tuberculosis, Number_smallpox, Number_cholera_cases)
SELECT Entity_Code.id, Infectious_Cases.Year, Infectious_Cases.Number_yaws, Infectious_Cases.polio_cases, Infectious_Cases.cases_guinea_worm, Infectious_Cases.Number_rabies, Infectious_Cases.Number_malaria, Infectious_Cases.Number_hiv, Infectious_Cases.Number_tuberculosis, Infectious_Cases.Number_smallpox, Infectious_Cases.Number_cholera_cases
FROM Infectious_Cases
JOIN Entity_Code ON Infectious_Cases.Entity = Entity_Code.Entity AND Infectious_Cases.Code = Entity_Code.Code;