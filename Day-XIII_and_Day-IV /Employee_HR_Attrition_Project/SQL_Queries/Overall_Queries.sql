-- So Today i have a project name Employee Attrition Analysis, for Analysing the Business Question is - 
-- "why the employee are leaving the company which factors are forcing ?"
-- to leave the company, HR give me a data set to understand it and make analysis with SQL and give him a report what factors have to be consider
-- to make the attrition rate low as much as possible 

-- Data Exploration 

SELECT * from dbo.clean_hr_data;
-- So we have 24 columns and 1470 rows data 
-- After seeing so much column i am just confuse where to start so i think to do approach of Dividing problem into smaller parts
-- So for that i saw my main thing is to find Attrition how much attrition is facing company over time and which factors are affecting or creating 
-- this attrition.


--  LEVEL - 1 (OVERALL)

SELECT 
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data;

--  So total leave employees are 237 | total employee 1470 | attrition rate is 16.12 %

--  so 16.12% is generally is bit higher rate so we have to find causes and its solutions


-- Level 2 — Who is leaving?

-- Attrition × Department
-- Attrition × JobRole
-- Attrition × AgeGroup
-- Attrition × Gender
-- Attrition × MaritalStatus
-- Attrition * Business_Travel

SELECT Age_Bucket,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
GROUP by Age_Bucket
ORDER by attrition_rate desc;

-- 18-25 (Entry-Level / High Mobility)
-- 35%

-- 26-35 (Mid-Career / Peak Risk)
-- 19%


SELECT JobRole,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
GROUP by JobRole
ORDER by attrition_rate desc;

-- Sales Representatives are highly moved from company by 39%


SELECT Gender,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
GROUP by Gender
ORDER by attrition_rate desc;

-- Males are highly 17%



SELECT MaritalStatus,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
(sum(Attrition)*100)/count(*) as attrition_rate
from dbo.clean_hr_data
GROUP by MaritalStatus
ORDER by attrition_rate desc;

-- Singles Are Highly by 25%
                            
                            

SELECT BusinessTravel,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
GROUP by BusinessTravel
ORDER by attrition_rate desc;     

--  Travel Frequent has High so it can be of high fatigue with out any compensation of salary



-- Level 3 — Why might they be leaving?
-- Attrition × OverTime
-- Attrition × JobSatisfaction
-- Attrition × WorkLifeBalance
-- Attrition × MonthlyIncome
-- Attrition × YearsAtCompany
-- Attrition × YearsSinceLastPromotion
-- Attrition × BusinessTravel


SELECT OverTime,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
GROUP by OverTime
ORDER by attrition_rate desc;     

-- Major factor is that most of employee doing overtime 100 -> 40 employee doing overtime -> 30% 

SELECT JobSatisfaction,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
GROUP by JobSatisfaction
ORDER by attrition_rate desc;     

-- Mostly dont have good satisfaction from job 40%


SELECT WorkLifeBalance,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
GROUP by WorkLifeBalance
ORDER by attrition_rate desc;     

-- 31 % dont like worklifebalance

select 
Salary_band,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
group by Salary_band
order by attrition_rate desc;

-- under 3k salary ones's leaving so much


select 
Since_Last_Year_Promotion_Bucket,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
group by Since_Last_Year_Promotion_Bucket
order by attrition_rate desc;

select 
years_with_curr_manager_bucket,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
group by years_with_curr_manager_bucket
order by attrition_rate desc;

---------------------------------------------------------------------------------------------------------------------------------



-- core things are like that the employees who salary is less than or equal to 3K have high attrition
-- we have to more focused on Entry level age groups because in early age they found to move different company's
-- why Sales Representative & sales Executive leave so much
-- Males 
-- Single
-- Travel_Frequently
-- Over time * Monthly income
-- manager relationship with employee in early stage (1-2yr)
---------------------------------------------------------------------------------------------------------------------------------------
-- Step 1: Calculate attrition rate by department. Which department loses the highest percentage of its employees?

SELECT Department,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
GROUP by Department
ORDER by attrition_rate desc;

-- Step 2: Find attrition rate by job role within the highest-risk department.
SELECT JobRole,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate
from dbo.clean_hr_data
where JobRole in ('Sales Representative','Sales Executive')
GROUP by JobRole
ORDER by attrition_rate desc;


-- Step 3: Compare average monthly income, years at company, 
-- and job satisfaction scores between employees who left vs those who stayed.

select 
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate,
avg(MonthlyIncome) as Avg_income
from dbo.clean_hr_data
order by attrition_rate desc;

select 
JobSatisfaction,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate

from dbo.clean_hr_data
group by JobSatisfaction
order by attrition_rate desc;


select 
Experience_Bucket,
sum(Attrition) as 'leaved_emploees_count',
count(*) as 'total_employee',
round((sum(Attrition)*100) / count(*),2) as attrition_rate

from dbo.clean_hr_data
group by Experience_Bucket
order by attrition_rate desc;
































----------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    'Salary <= 3k' AS Risk_Factor,
    COUNT(CASE WHEN Salary_band = 'under 3k' THEN 1 END) AS Total_Employees,
    SUM(CASE WHEN Salary_band = 'under 3k' THEN Attrition * 1 ELSE 0.0 END) AS Total_Attrition,
    ROUND(SUM(CASE WHEN Salary_band = 'under 3k' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN Salary_band = 'under 3k' THEN 1 END), 0), 2) AS Attrition_Rate_Pct
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Entry-Level Age (18-25)',
    COUNT(CASE WHEN Age_Bucket LIKE '18-25%' THEN 1 END),
    SUM(CASE WHEN Age_Bucket LIKE '18-25%' THEN Attrition * 1 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN Age_Bucket LIKE '18-25%' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN Age_Bucket LIKE '18-25%' THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Sales Roles (Rep & Exec)',
    COUNT(CASE WHEN JobRole IN ('Sales Representative', 'Sales Executive') THEN 1 END),
    SUM(CASE WHEN JobRole IN ('Sales Representative', 'Sales Executive') THEN Attrition * 1 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN JobRole IN ('Sales Representative', 'Sales Executive') THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN JobRole IN ('Sales Representative', 'Sales Executive') THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Frequent Business Travelers',
    COUNT(CASE WHEN BusinessTravel = 'Travel_Frequently' THEN 1 END),
    SUM(CASE WHEN BusinessTravel = 'Travel_Frequently' THEN Attrition * 1 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN BusinessTravel = 'Travel_Frequently' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN BusinessTravel = 'Travel_Frequently' THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Single Employees',
    COUNT(CASE WHEN MaritalStatus = 'Single' THEN 1 END),
    SUM(CASE WHEN MaritalStatus = 'Single' THEN Attrition * 1 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN MaritalStatus = 'Single' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN MaritalStatus = 'Single' THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Male Employees',
    COUNT(CASE WHEN Gender = 'Male' THEN 1 END),
    SUM(CASE WHEN Gender = 'Male' THEN Attrition * 1 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN Gender = 'Male' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN Gender = 'Male' THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'OverTime + Low Salary (under 3k)',
    COUNT(CASE WHEN OverTime = 1 AND Salary_band = 'under 3k' THEN 1 END),
    SUM(CASE WHEN OverTime = 1 AND Salary_band = 'under 3k' THEN Attrition * 1 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN OverTime = 1 AND Salary_band = 'under 3k' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN OverTime = 1 AND Salary_band = 'under 3k' THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Manager Tenure (0-2 years)',
    COUNT(CASE WHEN years_with_curr_manager_bucket = '0-2 years' THEN 1 END),
    SUM(CASE WHEN years_with_curr_manager_bucket = '0-2 years' THEN Attrition * 1 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN years_with_curr_manager_bucket = '0-2 years' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN years_with_curr_manager_bucket = '0-2 years' THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

ORDER BY Attrition_Rate_Pct DESC;

SELECT 
    'Low Work-Life Balance (Level 1)' AS Risk_Segment,
    COUNT(CASE WHEN WorkLifeBalance = 1 THEN 1 END) AS Total_Employees,
    SUM(CASE WHEN WorkLifeBalance = 1 THEN Attrition * 1.0 ELSE 0.0 END) AS Total_Attrition,
    ROUND(SUM(CASE WHEN WorkLifeBalance = 1 THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN WorkLifeBalance = 1 THEN 1 END), 0), 2) AS Attrition_Rate_Pct
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Low Work-Life Balance + OverTime',
    COUNT(CASE WHEN WorkLifeBalance = 1 AND OverTime = 1 THEN 1 END),
    SUM(CASE WHEN WorkLifeBalance = 1 AND OverTime = 1 THEN Attrition * 1.0 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN WorkLifeBalance = 1 AND OverTime = 1 THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN WorkLifeBalance = 1 AND OverTime = 1 THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Low Relationship Satisfaction (Level 1)',
    COUNT(CASE WHEN RelationshipSatisfaction = 1 THEN 1 END),
    SUM(CASE WHEN RelationshipSatisfaction = 1 THEN Attrition * 1.0 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN RelationshipSatisfaction = 1 THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN RelationshipSatisfaction = 1 THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'Low Relationship + Early Manager Tenure (0-2 yrs)',
    COUNT(CASE WHEN RelationshipSatisfaction = 1 AND years_with_curr_manager_bucket = '0-2 years' THEN 1 END),
    SUM(CASE WHEN RelationshipSatisfaction = 1 AND years_with_curr_manager_bucket = '0-2 years' THEN Attrition * 1.0 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN RelationshipSatisfaction = 1 AND years_with_curr_manager_bucket = '0-2 years' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN RelationshipSatisfaction = 1 AND years_with_curr_manager_bucket = '0-2 years' THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

UNION ALL

SELECT 
    'High Performer (Rating 4) + Low Salary (under 3k)',
    COUNT(CASE WHEN PerformanceRating = 4 AND Salary_band = 'under 3k' THEN 1 END),
    SUM(CASE WHEN PerformanceRating = 4 AND Salary_band = 'under 3k' THEN Attrition * 1.0 ELSE 0.0 END),
    ROUND(SUM(CASE WHEN PerformanceRating = 4 AND Salary_band = 'under 3k' THEN Attrition * 100.0 ELSE 0.0 END) 
          / NULLIF(COUNT(CASE WHEN PerformanceRating = 4 AND Salary_band = 'under 3k' THEN 1 END), 0), 2)
FROM dbo.clean_hr_data

ORDER BY Attrition_Rate_Pct DESC;
