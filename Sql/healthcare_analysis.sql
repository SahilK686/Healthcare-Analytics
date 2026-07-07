-- Healthcare Analytics SQL Project

CREATE DATABASE Healthcare_Analytics;

USE Healthcare_Analytics;


-- 1. View Dataset
SELECT * 
FROM healthcare_dataset;


-- 2. Total Number of Patients

SELECT 
COUNT(*) AS Total_Patients
FROM healthcare_dataset;


-- 3. Average Patient Age

SELECT 
AVG(Age) AS Average_Age
FROM healthcare_dataset;


-- 4. Gender Distribution

SELECT 
Gender,
COUNT(*) AS Patient_Count
FROM healthcare_dataset
GROUP BY Gender;


-- 5. Medical Condition Analysis

SELECT
`Medical Condition`,
COUNT(*) AS Total_Patients
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY Total_Patients DESC;


-- 6. Insurance Provider Analysis

SELECT
`Insurance Provider`,
COUNT(*) AS Patients
FROM healthcare_dataset
GROUP BY `Insurance Provider`
ORDER BY Patients DESC;


-- 7. Average Billing Amount by Medical Condition

SELECT
`Medical Condition`,
ROUND(AVG(`Billing Amount`),2) AS Average_Billing
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY Average_Billing DESC;


-- 8. Admission Type Analysis

SELECT
`Admission Type`,
COUNT(*) AS Total_Admissions
FROM healthcare_dataset
GROUP BY `Admission Type`;


-- 9. Medication Usage Analysis

SELECT
Medication,
COUNT(*) AS Usage_Count
FROM healthcare_dataset
GROUP BY Medication
ORDER BY Usage_Count DESC;


-- 10. Average Hospital Stay Days

SELECT
AVG(`Hospital Stay Days`) AS Average_Stay
FROM healthcare_dataset;


-- 11. Highest Billing Patients

SELECT
Age,
Gender,
`Medical Condition`,
`Billing Amount`
FROM healthcare_dataset
ORDER BY `Billing Amount` DESC
LIMIT 10;


-- 12. Age Group Analysis

SELECT
CASE
WHEN Age < 30 THEN 'Young'
WHEN Age BETWEEN 30 AND 60 THEN 'Adult'
ELSE 'Senior'
END AS Age_Group,
COUNT(*) AS Patient_Count
FROM healthcare_dataset
GROUP BY Age_Group;


-- 13. Test Result Prediction Analysis
-- (If Test Result column exists)

SELECT
`Test Results`,
COUNT(*) AS Result_Count
FROM healthcare_dataset
GROUP BY `Test Results`;