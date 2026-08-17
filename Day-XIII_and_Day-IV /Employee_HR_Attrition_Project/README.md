# 🚨 Employee Attrition Analysis — HR Risk & Retention

> **A SQL-based HR analytics project using Microsoft Fabric to analyze employee attrition, identify key risk factors, and flag currently active employees who show multiple historical attrition signals.**

---

## 📌 Project Overview

Employee attrition can create significant recruitment, training, and productivity costs for organizations.

This project analyzes the **IBM HR Analytics Employee Attrition Dataset** using **SQL in Microsoft Fabric** to understand employee attrition patterns and identify employee segments associated with higher attrition.

The complete analysis was performed using **SQL**.

The project follows a structured analytical approach:

```text
IBM HR Dataset
       ↓
Microsoft Fabric
       ↓
Data Cleaning & Transformation
       ↓
clean_hr_data Table
       ↓
SQL-Based EDA
       ↓
Attrition Analysis
       ↓
Risk Factor Analysis
       ↓
Employee Risk Scoring
       ↓
HR Retention Recommendations
```

---

# 🎯 Business Problem

The HR team wants to understand:

> **Why are employees leaving, which employee groups have higher attrition, and which currently active employees show multiple historical risk signals?**

The objective is to use SQL to transform raw HR data into **actionable business insights** that can help HR prioritize retention investigations.

---

# 📊 Dataset

**Dataset:** IBM HR Analytics Employee Attrition Dataset

| Metric                 |      Value |
| ---------------------- | ---------: |
| Total Employees        |  **1,470** |
| Total Columns          |     **24** |
| Employees Who Left     |    **237** |
| Employees Retained     |  **1,233** |
| Overall Attrition Rate | **16.12%** |

### Important Columns

| Category      | Columns                              |
| ------------- | ------------------------------------ |
| Attrition     | `Attrition`                          |
| Organization  | `Department`, `JobRole`              |
| Compensation  | `MonthlyIncome`                      |
| Experience    | `YearsAtCompany`                     |
| Satisfaction  | `JobSatisfaction`, `WorkLifeBalance` |
| Workload      | `OverTime`                           |
| Travel        | `BusinessTravel`                     |
| Demographics  | `Age`, `Gender`, `MaritalStatus`     |
| Management    | `YearsWithCurrManager`               |
| Career Growth | `YearsSinceLastPromotion`            |
| Performance   | `PerformanceRating`                  |

---

# 🛠️ Technology Stack

| Technology                   | Purpose                                         |
| ---------------------------- | ----------------------------------------------- |
| **SQL**                      | Data cleaning, transformation, EDA and analysis |
| **Microsoft Fabric**         | Data environment and SQL execution              |
| **IBM HR Analytics Dataset** | Source HR dataset                               |

### SQL Concepts Used

* `SELECT`
* `WHERE`
* `CASE`
* `GROUP BY`
* `ORDER BY`
* `HAVING`
* Aggregate Functions
* `COUNT()`
* `SUM()`
* `AVG()`
* `CAST()`
* CTEs
* Conditional Aggregation
* Calculated Columns
* Data Bucketing
* Segmentation
* Risk Scoring

---

# 🏗️ Data Preparation in Microsoft Fabric

The raw IBM HR dataset was loaded into **Microsoft Fabric** and transformed using SQL.

A cleaned analytical table called:

```text
clean_hr_data
```

was created for the analysis.

The data preparation process followed:

```text
Raw HR Dataset
      ↓
SQL Cleaning & Transformation
      ↓
clean_hr_data
      ↓
SQL Analysis
```

The cleaned table contains analysis-ready fields and derived business columns such as:

* `Age_Bucket`
* `Experience_Bucket`
* `Salary_band`
* `years_with_curr_manager_bucket`

These derived fields were created to make employee segmentation and risk analysis easier.

---

# 🧹 SQL Data Cleaning & Transformation

The initial stage focused on preparing the raw dataset for analysis.

Key activities included:

* Reviewing the dataset structure
* Understanding available columns
* Preparing analysis-ready data
* Creating derived columns
* Creating business-friendly buckets
* Standardizing values used during analysis
* Creating the final `clean_hr_data` table

### Business Bucketing

Raw numerical fields were transformed into meaningful business segments:

```text
Age
 ↓
Age Bucket

MonthlyIncome
 ↓
Salary Band

YearsAtCompany
 ↓
Experience Bucket

YearsWithCurrManager
 ↓
Manager Tenure Bucket
```

This allowed the analysis to focus on meaningful employee segments instead of individual numerical values.

---

# 📈 SQL-Based Exploratory Data Analysis

All **Exploratory Data Analysis (EDA)** was performed directly using SQL.

The analysis was structured around business questions rather than simply examining every column individually.

### EDA Flow

```text
Overall Attrition
       ↓
Department Analysis
       ↓
Job Role Analysis
       ↓
Age Segmentation
       ↓
Experience Analysis
       ↓
Salary Analysis
       ↓
Job Satisfaction
       ↓
Work-Life Balance
       ↓
Overtime
       ↓
Business Travel
       ↓
Manager Tenure
       ↓
Combined Risk Factors
```

---

# 📊 Overall Attrition

The first step was to establish the overall attrition baseline.

| Metric                 |     Result |
| ---------------------- | ---------: |
| Total Employees        |  **1,470** |
| Employees Who Left     |    **237** |
| Employees Retained     |  **1,233** |
| Overall Attrition Rate | **16.12%** |

### SQL Logic

```sql
SELECT
    COUNT(*) AS Total_Employees,

    SUM(
        CASE
            WHEN Attrition = 1 THEN 1
            ELSE 0
        END
    ) AS Employees_Left,

    CAST(
        100.0 *
        SUM(
            CASE
                WHEN Attrition = 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*)
        AS DECIMAL(10,2)
    ) AS Attrition_Rate

FROM dbo.clean_hr_data;
```

---

# 🔎 Key Findings

## 1. 👶 Age Is an Important Attrition Segment

Younger employees showed higher attrition rates.

| Age Group | Attrition Rate |
| --------- | -------------: |
| **18–25** |        **35%** |
| **26–35** |        **19%** |

### Business Interpretation

Early-career employees may require additional attention around:

* Career development
* Compensation progression
* Training opportunities
* Internal mobility
* Manager support
* Employee engagement

---

## 2. 💼 Sales Roles Show High Attrition

Sales-related roles were identified as an important area for further investigation.

**Sales Representative attrition:** approximately **39%**

This raises an important business question:

> **Why are Sales Representatives leaving at a higher rate?**

Potential areas for investigation include:

* Compensation
* Workload
* Business travel
* Sales targets
* Career progression
* Manager support

These are potential explanations that require further validation rather than proven causes.

---

## 3. 😊 Job Satisfaction

Lower job satisfaction groups showed higher attrition.

The SQL analysis examined attrition rates across different `JobSatisfaction` levels.

This highlighted the importance of monitoring:

* Employee satisfaction
* Manager relationships
* Work environment
* Career development
* Recognition
* Employee engagement

---

## 4. ⚖️ Work-Life Balance

Employees reporting poor work-life balance showed elevated attrition.

**Work-Life Balance Level 1** was identified as a higher-risk segment.

This suggests HR should evaluate work-life balance together with workload and overtime.

```text
Poor Work-Life Balance
          +
Overtime
          +
High Workload
          ↓
Potential Retention Risk
```

---

## 5. 💰 Salary

Employees in the **under 3K salary band** showed higher attrition.

This led to the following business hypothesis:

> **Lower compensation may be associated with higher attrition, particularly when combined with other risk factors.**

Salary was therefore analyzed alongside:

* Job role
* Experience
* Overtime
* Performance
* Career progression

---

## 6. ⏰ Overtime

Overtime was identified as another important attrition indicator.

The analysis examined:

```text
OverTime
    ↓
Attrition Rate
```

and:

```text
OverTime
    +
Monthly Income
    ↓
Potential Workload + Compensation Risk
```

This provides more useful business context than analyzing overtime independently.

---

## 7. ✈️ Business Travel

Frequent business travel was identified as another potential attrition indicator.

A possible combination is:

```text
Frequent Travel
       +
Overtime
       +
Low Compensation
       ↓
Potentially Higher Attrition Risk
```

However, business travel should be treated as a **risk signal rather than a proven cause of attrition**.

---

## 8. 👨‍💼 Experience & Manager Tenure

The SQL analysis also examined:

* Experience buckets
* Years at company
* Years with current manager
* Years since last promotion

Early-career employees showed higher attrition.

The analysis also identified the **0–2 year relationship with the current manager** as an area worth monitoring.

Potential areas for HR investigation include:

* Manager-employee relationship
* Onboarding
* Mentorship
* Career progression
* Role expectations

---

# 🧩 Risk Factor Analysis

After analyzing individual factors, multiple risk conditions were combined to create an **Employee Risk Score**.

### Risk Factors Used

Each matching condition contributes **1 point**:

```text
Salary < 3K
      +
Frequent Business Travel
      +
Overtime
      +
Early Experience
      +
0–2 Years With Current Manager
      +
Low Job Satisfaction
      +
Low Work-Life Balance
```

---

# 🧮 Employee Risk Scoring

The risk score is calculated as:

```text
Risk Score =
    Salary Risk
  + Travel Risk
  + Overtime Risk
  + Experience Risk
  + Manager Tenure Risk
  + Job Satisfaction Risk
  + Work-Life Balance Risk
```

### Risk Categories

| Risk Score | Risk Level     |
| ---------: | -------------- |
|    **5–7** | 🔴 High Risk   |
|    **3–4** | 🟠 Medium Risk |
|    **1–2** | 🟢 Low Risk    |

---

# 👥 Active Employee Risk Analysis

Risk scoring is performed only on **currently active employees**.

```sql
WHERE Attrition = 0
```

This is important because the purpose of the analysis is not to score employees who already left.

Instead, the goal is to identify:

> **Which current employees show multiple historical risk signals?**

The approach therefore moves from:

```text
Historical Attrition Analysis
          ↓
Identify Risk Factors
          ↓
Score Current Employees
          ↓
Prioritize HR Investigation
```

---

# 💻 SQL Risk Scoring

```sql
WITH Employee_Risk_Scoring AS (

    SELECT
        *,

        (
            CASE
                WHEN Salary_band = 'under 3k'
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN BusinessTravel = 'Travel_Frequently'
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN OverTime = 1
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN Experience_Bucket = '0 to 1 Year'
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN years_with_curr_manager_bucket = '0-2 years'
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN JobSatisfaction <= 2
                THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN WorkLifeBalance <= 2
                THEN 1
                ELSE 0
            END

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

    CASE
        WHEN Risk_Score >= 5
            THEN 'High Risk'

        WHEN Risk_Score >= 3
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS Attrition_Risk_Level

FROM Employee_Risk_Scoring

WHERE Attrition = 0

ORDER BY Risk_Score DESC;
```

---

# 🎯 Business Use of the Risk Table

The risk table allows HR to move from historical analysis toward proactive investigation.

```text
Historical Attrition Analysis
          ↓
Identify Risk Factors
          ↓
Combine Risk Signals
          ↓
Score Current Employees
          ↓
Prioritize HR Investigation
          ↓
Targeted Retention Actions
```

For example, an employee with a high risk score may have:

* Low salary
* Frequent business travel
* Overtime
* Low job satisfaction
* Poor work-life balance
* Short tenure with current manager

Instead of applying the same retention strategy to everyone, HR can prioritize employees based on their **individual risk profiles**.

---

# 💼 Recommended HR Actions

## 🔴 High-Risk Employees

Potential actions:

* Manager check-ins
* Compensation review
* Workload assessment
* Career development discussions
* Internal mobility opportunities
* Retention incentives where appropriate

---

## 🟠 Medium-Risk Employees

Potential actions:

* Engagement monitoring
* Career progression discussions
* Manager support
* Work-life balance review
* Recognition
* Regular feedback

---

## 🟢 Low-Risk Employees

Continue:

* Employee engagement programs
* Career development
* Recognition
* Regular satisfaction monitoring
* Internal growth opportunities

---

# 🧠 Key Business Questions Answered

This project explores:

* What is the overall employee attrition rate?
* Which age groups have the highest attrition?
* Which job roles have higher attrition?
* Which departments require attention?
* Does job satisfaction relate to attrition?
* Does work-life balance relate to attrition?
* Does overtime relate to attrition?
* Is lower salary associated with higher attrition?
* Does frequent business travel matter?
* Does early-career experience relate to attrition?
* Does manager tenure appear to be a risk indicator?
* Which currently active employees show multiple risk signals?
* How can HR prioritize retention investigations?

---

# ⚠️ Analytical Limitations

This project identifies **historical patterns and risk indicators**. It does not prove that any individual factor directly causes employee attrition.

Important limitations include:

* The dataset represents historical employee information.
* The risk score is rule-based.
* Each risk factor receives equal weight.
* The score is not a machine-learning prediction.
* The score should not be interpreted as a probability of resignation.
* Association does not establish causation.
* HR context and employee feedback are required before taking action.

> **The risk score should be used as a prioritization framework for HR investigation, not as a definitive prediction that an employee will leave.**

---

# 📌 Project Workflow

```text
IBM HR Analytics Dataset
          ↓
Load Data into Microsoft Fabric
          ↓
SQL Data Cleaning
          ↓
Create clean_hr_data
          ↓
SQL-Based EDA
          ↓
Overall Attrition Analysis
          ↓
Department & Job Role Analysis
          ↓
Age & Experience Analysis
          ↓
Salary Analysis
          ↓
Satisfaction & Work-Life Balance
          ↓
Overtime & Business Travel
          ↓
Manager Tenure Analysis
          ↓
Identify Risk Factors
          ↓
Create Employee Risk Score
          ↓
Filter Active Employees
          ↓
Risk Classification
          ↓
HR Retention Recommendations
```

---

# 🚀 Future Improvements

Although the current project is intentionally focused on SQL, it can later be extended with:

* Power BI dashboarding
* Statistical significance testing
* Weighted risk scoring
* Machine-learning attrition prediction
* Logistic Regression
* Random Forest
* Model explainability
* Employee-level prediction dashboards
* HR intervention tracking

These are **future extensions** and are not part of the current SQL analysis.

---

# ✅ Final Outcome

This project demonstrates how **SQL and Microsoft Fabric** can be used to transform raw HR data into actionable business insights.

The analysis progressed from:

```text
How many employees are leaving?
            ↓
Who is leaving?
            ↓
Which employee segments are affected?
            ↓
Which factors are associated with attrition?
            ↓
Which current employees show multiple risk signals?
            ↓
What can HR investigate or address?
```

The final **Employee Risk Scoring framework** provides HR with a structured way to prioritize current employees for further investigation.

> ### 🎯 Key Takeaway
>
> **The objective is not to predict that an employee will definitely leave. The objective is to identify currently active employees showing multiple historical attrition signals so HR can investigate their situation and take proactive retention action where appropriate.**

---

## 👨‍💻 Author

**Sahil Murti**

**Data Analyst | SQL | Business Analytics | Data Visualization**

---

## ⭐ If You Found This Project Useful

If you found this SQL analysis useful, consider giving the repository a ⭐ on GitHub.
