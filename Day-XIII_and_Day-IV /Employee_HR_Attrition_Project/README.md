# 🚨 Employee Attrition Analysis — HR Risk & Retention

> **Using SQL and data analysis to identify factors associated with employee attrition and flag currently active employees who may require proactive retention attention.**

---

## 📌 Project Overview

Employee attrition is a major challenge for organizations because replacing experienced employees can increase recruitment costs, training expenses, and productivity loss.

This project analyzes the **IBM HR Analytics Employee Attrition Dataset** to understand:

* Why employees leave
* Which employee groups experience higher attrition
* Which factors are associated with employee turnover
* Which currently active employees show multiple historical risk signals
* What HR actions could be considered for higher-risk segments

Rather than analyzing all columns simultaneously, the analysis follows a structured business approach:

```text
Data Exploration
       ↓
Data Cleaning & Preparation
       ↓
Overall Attrition Analysis
       ↓
Who Is Leaving?
       ↓
Why Might They Be Leaving?
       ↓
Risk Factor Analysis
       ↓
Employee Risk Scoring
       ↓
HR Retention Recommendations
```

---

# 🎯 Business Problem

The HR team wants to answer:

> **Why are employees leaving, which employee groups are most affected, and which current employees may show higher historical attrition risk?**

The objective is to identify **actionable risk indicators** that HR can investigate and potentially address through targeted retention strategies.

---

# 📊 Dataset

**Dataset:** IBM HR Analytics Employee Attrition Dataset

| Metric                 |      Value |
| ---------------------- | ---------: |
| Total Employees        |  **1,470** |
| Total Columns          |     **24** |
| Employees Who Left     |    **237** |
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

# 📈 Overall Attrition

The first step was establishing the overall attrition baseline.

| Metric                 |     Result |
| ---------------------- | ---------: |
| Total Employees        |  **1,470** |
| Employees Who Left     |    **237** |
| Overall Attrition Rate | **16.12%** |

### Key Insight

The **16.12% attrition rate** provides the baseline against which different employee segments can be compared.

---

# 🔎 Key Findings

## 1. 👶 Younger Employees Show Higher Attrition

Younger employees showed considerably higher attrition rates.

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

Sales-related roles were identified as an important risk area.

**Sales Representative attrition:** approximately **39%**

This raises an important business question:

> **Why are Sales Representatives and other sales employees leaving at higher rates?**

Potential areas for further investigation include:

* Compensation
* Workload
* Business travel
* Sales targets
* Career progression
* Manager support

These factors should be validated before concluding that any one factor directly causes attrition.

---

## 3. 😊 Job Satisfaction Is Associated With Attrition

Employees reporting lower job satisfaction showed higher attrition.

This suggests that HR should monitor:

* Employee satisfaction
* Manager relationships
* Work environment
* Career development
* Recognition
* Engagement

### Business Question

> Are employees leaving because they are dissatisfied, or are other factors contributing to both dissatisfaction and attrition?

Further employee feedback and organizational data would help answer this.

---

## 4. ⚖️ Work-Life Balance

Employees reporting poor work-life balance showed elevated attrition.

**Work-Life Balance Level 1** was identified as a higher-risk segment.

This suggests HR should evaluate:

```text
Workload
   +
Overtime
   +
Work-Life Balance
   ↓
Employee Retention Risk
```

Work-life balance should therefore be analyzed alongside workload and overtime rather than independently.

---

## 5. 💰 Salary Is an Important Risk Indicator

Employees in the **under 3K salary band** showed higher attrition.

This led to an important business hypothesis:

> **Employees with relatively low compensation may have a higher tendency to leave, particularly when combined with other risk factors.**

Salary should be analyzed together with:

* Job role
* Experience
* Overtime
* Performance
* Career progression

rather than treated as an isolated factor.

---

## 6. ⏰ Overtime

Overtime was identified as another important factor associated with attrition.

The analysis examined:

```text
OverTime
   ↓
Attrition Rate
```

and also considered:

```text
OverTime + Monthly Income
```

This helps identify employees who may be experiencing a combination of:

**High workload + relatively low compensation**

---

## 7. ✈️ Business Travel

Frequent business travel was identified as another potential risk indicator.

A possible business interpretation is:

```text
Frequent Travel
      +
High Workload
      +
Low Compensation
      ↓
Potentially Higher Attrition Risk
```

However, travel should be treated as a **risk indicator rather than a proven cause**.

---

## 8. 👨‍💼 Early Career & Manager Tenure

The analysis also examined:

* Experience buckets
* Years at company
* Years with current manager
* Years since last promotion

Employees in the early stages of their careers showed higher attrition.

The analysis also highlighted the **0–2 year relationship with the current manager** as an area worth monitoring.

Possible HR areas of investigation include:

* Manager-employee relationship
* Onboarding quality
* Career progression
* Mentorship
* Role expectations

---

# 🧩 Risk Factor Analysis

To move beyond analyzing individual factors, multiple risk conditions were combined into an **employee risk score**.

### Risk Factors

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

The scoring model is applied only to **currently active employees**:

```sql
WHERE Attrition = 0
```

This is important because the objective is to identify **current employees who may require retention attention**, rather than scoring employees who have already left.

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

The risk table allows HR to move from:

```text
Historical Attrition Analysis
          ↓
Identify Risk Factors
          ↓
Identify Current At-Risk Employees
          ↓
Prioritize HR Investigation
          ↓
Targeted Retention Actions
```

For example, a high-risk employee may have:

* Low salary
* Frequent travel
* Overtime
* Low job satisfaction
* Poor work-life balance
* Short tenure with current manager

Instead of applying the same retention strategy to every employee, HR can prioritize employees based on their **risk profile and individual circumstances**.

---

# 💼 Recommended HR Actions

## 🔴 High-Risk Employees

Prioritize for:

* Manager check-ins
* Compensation review
* Workload assessment
* Career development discussions
* Internal mobility opportunities
* Retention incentives where justified

---

## 🟠 Medium-Risk Employees

Focus on:

* Engagement monitoring
* Career progression
* Manager support
* Work-life balance
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

The project explored:

* What is the overall attrition rate?
* Which age groups have the highest attrition?
* Which job roles are most affected?
* Which departments require attention?
* Does job satisfaction relate to attrition?
* Does work-life balance relate to attrition?
* Does overtime relate to attrition?
* Is lower salary associated with higher attrition?
* Does frequent business travel matter?
* Does early-career experience relate to attrition?
* Does manager tenure appear to be a risk indicator?
* Which currently active employees match multiple risk factors?
* How can HR prioritize employees for further investigation?

---

# ⚠️ Analytical Limitations

This project identifies **historical patterns and risk indicators**. It does **not** prove that any individual factor directly causes employee attrition.

Important limitations include:

* The dataset represents historical employee information.
* The risk score is rule-based rather than a machine-learning prediction.
* Every selected risk factor receives equal weight.
* Correlation or association does not establish causation.
* The risk score should not be interpreted as a guaranteed probability of resignation.
* HR context and employee feedback are required before taking action.
* Further statistical or predictive modeling could improve the risk assessment.

> **The risk score is intended as a prioritization tool for HR investigation, not as a definitive prediction of employee resignation.**

---

# 🛠️ Technology Stack

| Technology             | Purpose                                          |
| ---------------------- | ------------------------------------------------ |
| **SQL**                | Data cleaning, segmentation & analysis           |
| **Microsoft Fabric**   | Data processing & analytics environment          |
| **Python**             | Data processing & exploration                    |
| **Pandas**             | Data manipulation                                |
| **Data Cleaning**      | Preparing analysis-ready employee data           |
| **EDA**                | Identifying patterns and relationships           |
| **Business Analytics** | Translating findings into HR insights            |
| **Risk Scoring**       | Identifying employees with multiple risk signals |

---

# 📌 Project Workflow

```text
IBM HR Dataset
       ↓
Data Exploration
       ↓
Data Cleaning
       ↓
Column Understanding
       ↓
Overall Attrition Analysis
       ↓
Department / Role Analysis
       ↓
Employee Demographic Analysis
       ↓
Satisfaction / Salary / Overtime Analysis
       ↓
Risk Factor Analysis
       ↓
Employee Risk Scoring
       ↓
HR Retention Recommendations
```

---

# 📊 Analytical Framework

The project follows a **descriptive → diagnostic → prescriptive** approach:

### 1️⃣ Descriptive Analytics

```text
How many employees are leaving?
Who is leaving?
Which segments have higher attrition?
```

### 2️⃣ Diagnostic Analytics

```text
Which factors are associated with higher attrition?
Why might certain groups be more vulnerable?
```

### 3️⃣ Prescriptive Thinking

```text
Which current employees show multiple risk signals?
What HR actions could be considered?
```

This makes the project more than a simple attrition-rate calculation.

---

# 🚀 Future Improvements

The analysis can be extended by:

* Building an interactive Power BI HR dashboard
* Creating department-level risk dashboards
* Applying statistical significance testing
* Testing weighted risk scores
* Building a machine-learning attrition prediction model
* Comparing Logistic Regression, Random Forest and XGBoost
* Evaluating model precision and recall
* Creating explainable employee-level predictions
* Adding HR intervention tracking
* Measuring whether retention interventions reduce future attrition

---

# ✅ Final Outcome

This project moved beyond simply answering:

> **"How many employees are leaving?"**

The analysis progressed through:

```text
How many are leaving?
        ↓
Who is leaving?
        ↓
Which factors are associated with attrition?
        ↓
Which current employees show multiple risk signals?
        ↓
What can HR investigate or address?
```

The final risk-scoring framework provides HR with a structured way to **prioritize employees for further investigation and targeted retention actions**.

> ### 🎯 Key Takeaway
>
> **The goal is not to predict that an employee will definitely leave. The goal is to identify currently active employees who show multiple historical risk signals so HR can investigate their situation and potentially intervene proactively.**

---

## 👨‍💻 Author

**Sahil Murti**

**Data Analyst | SQL | Business Analytics | Data Visualization**

---

## ⭐ If You Found This Project Useful

If you found this analysis interesting, consider giving the repository a ⭐ on GitHub.

