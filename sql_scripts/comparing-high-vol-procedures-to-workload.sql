Are high-volume procedures linked to departments under pressure?
SELECT
    e.department,
    p.procedure_description,
    COUNT(*) AS procedure_volume
FROM fact_encounters e
JOIN fact_procedures p
    ON e.encounter_id = p.encounter_id
GROUP BY e.department, p.procedure_description
ORDER BY procedure_volume DESC;
