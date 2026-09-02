Are there signs of financial inefficiency (high volume but low payment yield)?
SELECT
    e.department,
    COUNT(*) AS encounters,
    ROUND(SUM(f.total_charges),2) AS total_charges,
    ROUND(
        SUM(f.insurance_payments + f.patient_payments),
        2
    ) AS payments_received,
    ROUND(
        (
            SUM(f.insurance_payments + f.patient_payments)
            /
            NULLIF(SUM(f.total_charges),0)
        ) * 100,
        2
    ) AS collection_rate_percent,
    ROUND(SUM(f.outstanding_balance),2) AS outstanding_balance
FROM fact_encounters e
JOIN fact_financial_summary f
    ON e.encounter_id = f.encounter_id
GROUP BY e.department
ORDER BY collection_rate_percent ASC;
