Tertiary-hospital-performance-and-payer-insights

Healthcare data analytics project analyzing patient volume, average length of stay, diagnoses, procedures, and financial performance

Executive Overview
Tertiary hospitals often face significant pressure from the continuous influx of patients referred from primary and secondary healthcare facilities. The resulting high patient volume and admission rates can make it challenging to maintain accurate oversight of hospital performance and financial records.
Therefore, this was project was carried out in order to investigate hospital performance and provide actionable insights and recommendations especially in these areas;
•	Clinical performance (patient volume, average length of stay, and departmental workload)
•	Diagnosis and procedure utilization (high-volume diagnoses and procedures and their clinical alignment)
•	Service utilization and demand trends (encounter volumes and patient activity across hospital departments)
•	Financial and payer performance (charges, payments, payer distribution, and payment patterns)

Using encounter-level electronic health record (EHR) data from a tertiary hospital, the project evaluates how patient demand, clinical activity, service utilization, and financial performance vary across departments, diagnoses, procedures, and payer types. The analysis moves beyond descriptive reporting to identify operational pressure points, high-volume clinical conditions, utilization patterns, and areas of financial exposure.

The Tableau dashboards are designed to provide healthcare leadership with actionable insights to support resource allocation, capacity planning, service optimization, clinical performance monitoring, and financial decision-making. While based on synthetic data, the project is structured to reflect real-world hospital analytics workflows and the types of insights that can support data-driven healthcare management.

Data Structure & Initial Checks
The analysis uses encounter-level electronic health record (EHR) data generated through Synthea, an open-source synthetic patient data generator. Although the dataset is synthetic, it is used as a representation of real-world hospital data, with consistent clinical and operational assumptions applied to reflect realistic hospital workflows and performance.

Project analysis period: 25/05/2026 – 10/06/2026
Encounter history covered: 2000–2025 

Tables Used in Analysis
The analysis was built using four core tables from the tertiary hospital dataset:
•	patients – patient demographics, identifiers, and patient-level information
•	encounters – encounter dates, encounter classes, departments, diagnoses, and length-of-stay information
•	procedures – procedures and clinical services performed during patient encounters
•	payers – payer information, insurance coverage, charges, payments, and financial attributes

Insights Deep Dive

Operational Performance
The analysis revealed significant variation in patient volumes across hospital departments. Internal Medicine emerged as the busiest department, accounting for the highest number of patient encounters and procedures. This suggests increased demand for services within the department and highlights the need for effective resource allocation to manage workload and maintain service quality.
Patient encounter trends showed sustained utilization of hospital services over multiple years, indicating consistent demand for healthcare delivery. Additionally, the analysis of length of stay identified opportunities to improve patient flow and bed utilization, particularly among patients with complex medical conditions requiring prolonged care.

Clinical Performance (diagnoses and procedure)
The clinical dashboard demonstrated that a relatively small number of diagnoses accounted for a large proportion of hospital encounters. Chronic Kidney Disease emerged as one of the most prevalent conditions within the dataset and was associated with longer average lengths of stay compared to other diagnoses.
Procedure utilization patterns generally aligned with dominant diagnoses, suggesting that clinical interventions are largely consistent with patient treatment needs. However, the concentration of certain conditions highlights the growing burden of chronic diseases and the importance of strengthening preventive care, early diagnosis, and disease management programmes.

Financial performance
Financial analysis revealed that insurance payments contributed a substantial share of hospital revenue compared to direct patient payments. This finding underscores the importance of insurance reimbursement as a critical component of financial sustainability.
Revenue generation varied across departments and service areas, with high-volume departments contributing significantly to overall income. However, the analysis also indicated that higher patient volume does not always translate into proportionally higher revenue, suggesting potential opportunities to improve billing efficiency, reimbursement processes, and financial performance management.

Recommendations

Hospital Operations
Allocate additional resources to high-volume departments to improve patient flow and reduce operational bottlenecks.

Clinical Insights	
Strengthen chronic disease prevention and management programmes to improve patient outcomes and reduce prolonged hospital stays.

Financial Performance
Enhance insurance utilization and revenue cycle management to improve financial sustainability and maximize revenue collection.




