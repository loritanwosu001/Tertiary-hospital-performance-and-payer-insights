Which departments have the highest patient load? 
SELECT
    department,
    COUNT(*) AS total_encounters
FROM fact_encounters
GROUP BY department
ORDER BY total_encounters DESC;
