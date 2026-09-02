How has patient volume changed over time? 
SELECT
    DATE_TRUNC('month', start_date) AS month,
    COUNT(encounter_id) AS patient_volume
FROM fact_encounters
GROUP BY 1
ORDER BY 1;
