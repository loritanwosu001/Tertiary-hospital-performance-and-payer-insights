Are there departments showing increasing trends in volume or LOS over time?
SELECT
    DATE_TRUNC('month', start_date) AS month,
    department,
    COUNT(*) AS encounter_count
FROM fact_encounters
GROUP BY 1,2
ORDER BY department, month;

--
SELECT
    DATE_TRUNC('month', start_date) AS month,
    department,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (stop_date - start_date)) / 86400),
        2
    ) AS average_los_days
FROM fact_encounters
WHERE stop_date IS NOT NULL
GROUP BY 1,2
ORDER BY department, month;
