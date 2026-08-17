-- A table to found employee who were in high risk criteria

WITH Employee_Risk_Scoring AS (
    SELECT 
        *,
        -- 1. Calculate a Risk Score (Count matching risk factors)
        (
            CASE WHEN Salary_band = 'under 3k' THEN 1 ELSE 0 END +
            CASE WHEN BusinessTravel = 'Travel_Frequently' THEN 1 ELSE 0 END +
            CASE WHEN OverTime = 1 THEN 1 ELSE 0 END +
            CASE WHEN Experience_Bucket = '0 to 1 Year' THEN 1 ELSE 0 END +
            CASE WHEN years_with_curr_manager_bucket = '0-2 years' THEN 1 ELSE 0 END +
            CASE WHEN JobSatisfaction <= 2 THEN 1 ELSE 0 END +
            CASE WHEN WorkLifeBalance <= 2 THEN 1 ELSE 0 END
        ) AS Risk_Score
    FROM dbo.clean_hr_data
)
SELECT 
    Department,
    JobRole,
    Age_Bucket,
    Experience_Bucket,
    BusinessTravel,
    years_with_curr_manager_bucket,
    Salary_band,
    OverTime,
    JobSatisfaction,
    WorkLifeBalance,
    Risk_Score,
    -- 2. Categorize the Risk Level
    CASE 
        WHEN Risk_Score >= 5 THEN 'High Risk'
        WHEN Risk_Score >= 3 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Attrition_Risk_Level
FROM Employee_Risk_Scoring
WHERE Attrition = 0 -- 3. Filter ONLY active employees to flag who might leave next
ORDER BY Risk_Score DESC;



