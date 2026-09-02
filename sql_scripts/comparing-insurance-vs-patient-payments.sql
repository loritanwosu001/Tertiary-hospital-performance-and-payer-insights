What is the breakdown of insurance vs patient payments? 
SELECT
    ROUND(SUM(insurance_payments),2) AS insurance_payments,
    ROUND(SUM(patient_payments),2) AS patient_payments,
    ROUND(
        SUM(insurance_payments) /
        NULLIF(
            SUM(insurance_payments) +
            SUM(patient_payments),
            0
        ) * 100,
        2
    ) AS insurance_percentage,
    ROUND(
        SUM(patient_payments) /
        NULLIF(
            SUM(insurance_payments) +
            SUM(patient_payments),
            0
        ) * 100,
        2
    ) AS patient_percentage
FROM fact_financial_summary;
