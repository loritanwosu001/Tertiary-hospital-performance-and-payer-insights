What are the most common procedures being performed? 
SELECT
    procedure_description,
    COUNT(*) AS procedure_count
FROM fact_procedures
GROUP BY procedure_description
ORDER BY procedure_count DESC
LIMIT 20;
