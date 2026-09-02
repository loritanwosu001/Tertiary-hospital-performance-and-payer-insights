Are high-volume departments also generating proportionate revenue? 
SELECT
    e.department,
    COUNT(*) AS encounters,
    ROUND(SUM(f.total_charges),2) AS total_revenue,
    ROUND(AVG(f.total_charges),2) AS average_revenue_per_encounter
FROM fact_encounters e
JOIN fact_financial_summary f
    ON e.encounter_id = f.encounter_id
GROUP BY e.department
ORDER BY total_revenue DESC;
