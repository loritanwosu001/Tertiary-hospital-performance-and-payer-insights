--1.	How has patient volume changed over time? 
SELECT
    DATE_TRUNC('month', start_date) AS month,
    COUNT(encounter_id) AS patient_volume
FROM fact_encounters
GROUP BY 1
ORDER BY 1;

--2.	What is the trend in average length of stay (LOS)? 
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

--3.	Are there any significant changes in hospital activity over time?
SELECT
    DATE_TRUNC('month', start_date) AS month,
    COUNT(*) AS total_encounters,
    COUNT(DISTINCT patient_id) AS unique_patients,
    COUNT(DISTINCT diagnosis_code) AS diagnosis_variety
FROM fact_encounters
GROUP BY 1
ORDER BY 1;

--4.	Which departments have the highest patient load? 
SELECT
    department,
    COUNT(*) AS total_encounters
FROM fact_encounters
GROUP BY department
ORDER BY total_encounters DESC;

--5.	Which departments have the longest LOS? 
SELECT
    department,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (stop_date - start_date)) / 86400),
        2
    ) AS average_los_days
FROM fact_encounters
WHERE stop_date IS NOT NULL
GROUP BY department
ORDER BY average_los_days DESC;

--6.	Are there departments showing increasing trends in volume or LOS over time?
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

--7.	What are the top diagnoses driving hospital visits? 
SELECT
    diagnosis,
    COUNT(*) AS visit_count
FROM fact_encounters
GROUP BY diagnosis
ORDER BY visit_count DESC
LIMIT 10;

--8.	Are certain conditions associated with longer LOS? 
SELECT
    diagnosis,
    COUNT(*) AS encounters,
    ROUND(
        AVG(EXTRACT(EPOCH FROM (stop_date - start_date)) / 86400),
        2
    ) AS average_los_days
FROM fact_encounters
WHERE stop_date IS NOT NULL
GROUP BY diagnosis
HAVING COUNT(*) >= 10
ORDER BY average_los_days DESC;

--9.	Are there shifts in case mix (type of diseases over time)?
SELECT
    DATE_TRUNC('month', start_date) AS month,
    diagnosis,
    COUNT(*) AS diagnosis_count
FROM fact_encounters
GROUP BY 1,2
ORDER BY month, diagnosis_count DESC;

--10.	What are the most common procedures being performed? 
SELECT
    procedure_description,
    COUNT(*) AS procedure_count
FROM fact_procedures
GROUP BY procedure_description
ORDER BY procedure_count DESC
LIMIT 20;

--11.	Are procedures aligned with the dominant diagnoses? 
SELECT
    e.diagnosis,
    p.procedure_description,
    COUNT(*) AS frequency
FROM fact_encounters e
JOIN fact_procedures p
    ON e.encounter_id = p.encounter_id
GROUP BY e.diagnosis, p.procedure_description
ORDER BY frequency DESC;

--12.	Are high-volume procedures linked to departments under pressure?
SELECT
    e.department,
    p.procedure_description,
    COUNT(*) AS procedure_volume
FROM fact_encounters e
JOIN fact_procedures p
    ON e.encounter_id = p.encounter_id
GROUP BY e.department, p.procedure_description
ORDER BY procedure_volume DESC;

--13.	How have total charges and payments changed over time? 
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

--14.	What is the breakdown of insurance vs patient payments? 
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

--15.	Are high-volume departments also generating proportionate revenue? 
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

--16.	Are there signs of financial inefficiency (high volume but low payment yield)?
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