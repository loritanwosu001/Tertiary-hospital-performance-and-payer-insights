How have total charges and payments changed over time? 
SELECT
    DATE_TRUNC('month', e.start_date) AS month,
    ROUND(SUM(f.total_charges),2) AS total_charges,
    ROUND(
        SUM(f.insurance_payments + f.patient_payments),
        2
    ) AS total_payments
FROM fact_encounters e
JOIN fact_financial_summary f
    ON e.encounter_id = f.encounter_id
GROUP BY 1
ORDER BY 1;
