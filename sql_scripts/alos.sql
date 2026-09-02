What is the trend in average length of stay (LOS)? 
SELECT
    DATE_TRUNC('month', start_date) AS month,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (stop_date - start_date)) / 86400),
        2
    ) AS average_los_days
FROM fact_encounters
WHERE stop_date IS NOT NULL
GROUP BY 1
ORDER BY 1;
