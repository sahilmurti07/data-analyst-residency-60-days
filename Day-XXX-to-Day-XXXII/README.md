# 📊 60-Day Data Analytics Roadmap — Days 30–32

> **From SQL Business Analysis to Interactive Business Intelligence**

---

## 🌐 Project Links

### 🚀 Live Streamlit Dashboard
[View Live Dashboard](https://ecommerce-sales-profitability-analysis.streamlit.app/)

### 💻 GitHub Repository
[View Project Repository](https://github.com/sahilmurti07/ecommerce-sales-profitability-analysis)

---

## 📌 Project Overview

Days **30–32** of my **60-Day Data Analytics Roadmap** focused on moving beyond individual SQL queries and building a complete **business analytics project**.

The goal was to understand how a Data Analyst approaches a real business problem from start to finish:

**Business Problem → Data Investigation → SQL Analysis → Insights → Dashboard → Recommendations**

During these three days, I worked on an **E-Commerce Sales & Profitability Analysis** project.

The main objective was to understand why the business was facing profitability issues despite generating revenue and to identify **where the losses were concentrated**.

Instead of looking only at overall sales and profit, I followed a structured drill-down approach.

### 🔎 Analytical Drilldown

```text
Company
   ↓
Month
   ↓
State
   ↓
City
   ↓
Category
   ↓
Subcategory
   ↓
Product
```

This approach helped move from a broad business problem to specific areas that management could investigate and act upon.

---

# 📅 Day 30 — Business Problem & SQL Investigation

## 🎯 Objective

The focus of Day 30 was to understand the dataset from a **business perspective** instead of immediately writing SQL queries.

### Business Problem

> **The company is generating revenue, but profitability is inconsistent. Management needs to understand when and where profit is being lost and which business areas require attention.**

### ❓ Key Business Questions

- Which months have the highest and lowest revenue?
- Which months are generating losses?
- Which states contribute the most revenue?
- Which states generate the largest absolute losses?
- Which states have poor profit margins?
- Are the losses concentrated in particular cities?
- Which categories are underperforming?
- Which subcategories contribute most to the losses?
- Which products require further investigation?

---

## 🧠 Investigation Framework

I followed a structured analytical approach:

```text
Validate
   ↓
Locate
   ↓
Drill Down
   ↓
Quantify
   ↓
Communicate
```

### 1️⃣ Validate

First, understand the overall business performance using:

- Revenue
- Profit
- Profit Margin %
- Quantity

### 2️⃣ Locate

Identify where the profitability problem exists across:

- Month
- State
- City

### 3️⃣ Drill Down

Once a problematic location was identified, drill deeper:

```text
State
  ↓
City
  ↓
Category
  ↓
Subcategory
  ↓
Product
```

### 4️⃣ Quantify

Measure the impact using:

- Revenue
- Profit
- Profit Margin %
- Revenue Contribution %
- Quantity

### 5️⃣ Communicate

Convert SQL outputs into understandable business insights and recommendations.

---

## 📊 SQL Analysis Performed

During Day 30, I performed:

- Monthly Revenue Analysis
- Monthly Profit Analysis
- Profit Margin Analysis
- State-wise Revenue Analysis
- State-wise Profit Analysis
- City-level Profitability Analysis
- Category-level Analysis
- Subcategory-level Analysis
- Product-level Analysis

---

## 🔍 Important Analytical Learning

One of the biggest lessons was understanding the difference between:

### Absolute Profit/Loss

Shows the actual amount of money gained or lost.

### Profit Margin %

Shows how efficiently revenue is converted into profit.

For example:

```text
State A
Profit = -₹10,000
Margin = -10%

State B
Profit = -₹1,000
Margin = -40%
```

State B has the worse margin, but State A creates the larger actual business loss.

Therefore, both **Profit and Profit Margin %** should be analyzed together.

---

## 📌 Day 30 Key Learning

> **Don't start with random SQL queries. Start with a business question and progressively drill down into the data.**

---

# 📅 Day 31 — Advanced SQL & Business Analysis

## 🎯 Objective

Day 31 focused on using **advanced SQL analytical techniques and window functions** to understand trends, compare performance over time, and quantify business contribution.

---

## 📈 Monthly Performance Analysis

Monthly revenue and profit were analyzed from:

**April 2018 → March 2019**

The analysis included:

- Current Month Sales
- Previous Month Sales
- Sales Growth %
- Current Month Profit
- Previous Month Profit
- Profit Growth %
- Running Revenue
- Running Profit

---

## 🪟 Window Functions

### LAG()

`LAG()` was used to compare current month performance with the previous month.

```sql
LAG(sales) OVER (
    ORDER BY month_date
) AS previous_month_sales
```

This made it possible to calculate **Month-over-Month Sales Growth**.

---

### 📈 Running Total

Running profit was calculated using:

```sql
SUM(profit) OVER (
    ORDER BY month_date
) AS running_profit
```

Running revenue can similarly be calculated using:

```sql
SUM(sales) OVER (
    ORDER BY month_date
) AS running_revenue
```

This helped understand how cumulative business performance changed throughout the year.

---

## 🌍 Revenue Contribution Analysis

Another important analysis was determining how much each state contributed to total company revenue.

```sql
ROUND(
    SUM(Amount) * 100.0 /
    SUM(SUM(Amount)) OVER(),
    2
) AS revenue_contribution_pct
```

This answers the business question:

> **Which states are responsible for the largest share of company revenue?**

One important finding was that:

> **Maharashtra and Madhya Pradesh together contributed approximately 46% of total revenue.**

However, high revenue contribution did not automatically mean high profitability.

---

## 📊 Profit Margin Analysis

Profit Margin was calculated using:

```text
Profit Margin % = Profit / Revenue × 100
```

For example:

```text
Profit Margin = 5%
```

means approximately:

> **₹5 profit is generated for every ₹100 of revenue.**

A negative profit margin indicates that the business segment is generating a loss.

---

## 🔎 State × Month Analysis

Instead of only looking at total state profit, I analyzed state profitability across individual months.

This helped distinguish between:

- States with temporary losses
- States with persistent losses
- States whose profitability deteriorated over time
- States with concentrated losses in particular months

For example, **Madhya Pradesh showed negative profitability across multiple months**, making it an important area for deeper investigation.

---

## 🔬 Drill-Down Investigation

The analysis was then extended from State to City, Category and Subcategory.

Example:

```text
Madhya Pradesh
      ↓
Indore
      ↓
Furniture
      ↓
Tables & Chairs
```

The important learning was that a category should not automatically be labelled as the problem.

For example, within Furniture:

```text
Furniture
   ↓
Tables        → Loss
Chairs        → Loss
Furnishings   → Smaller Loss
Bookcases     → Profit
```

This showed that losses could be concentrated in specific subcategories while other subcategories remained profitable.

---

## 🧠 Multiple Cause Analysis

Another major learning was that business problems do not always have one universal root cause.

Different locations showed different profitability patterns.

For example:

```text
Madhya Pradesh
      ↓
Indore
      ↓
Furniture
      ↓
Tables & Chairs
```

while another location could follow:

```text
Maharashtra
      ↓
Mumbai
      ↓
Electronics
      ↓
Electronic Games
```

This means the correct analytical question is not always:

> **"What is THE root cause?"**

Instead:

> **"What are the major contributors to the problem, and how much does each contribute?"**

---

## 📌 Day 31 Key Learning

> **Revenue contribution and profitability are different business concepts. A high-revenue segment can still have poor profitability.**

Advanced SQL helped move beyond simply finding totals and allowed me to understand:

**Trend → Comparison → Contribution → Persistence → Business Impact**

---

# 📅 Day 32 — Streamlit Dashboard & Business Communication

## 🎯 Objective

Day 32 focused on converting the SQL analysis into an **interactive Streamlit dashboard**.

The goal was not simply to create charts.

The objective was to make the business investigation easier to understand and explore.

---

## 📊 Dashboard Metrics

The dashboard brings together important KPIs such as:

- Total Revenue
- Total Profit
- Profit Margin %
- Revenue Contribution %
- Monthly Revenue
- Monthly Profit
- Month-over-Month Performance
- State Performance
- City Performance
- Category Performance
- Subcategory Performance
- Product-level Profitability
- Running Revenue
- Running Profit

---

## 🔎 Interactive Drilldown

The dashboard follows the same analytical structure used during the SQL investigation:

```text
Overall Business
       ↓
Monthly Performance
       ↓
State
       ↓
City
       ↓
Category
       ↓
Subcategory
       ↓
Product
```

This makes it possible to move from a high-level KPI to the specific business segment contributing to poor profitability.

---

# 💡 Major Business Insights

## 1️⃣ Profitability Was Not a Single-Month Problem

The monthly analysis showed that profitability problems appeared across multiple months.

This indicated that the issue required deeper investigation instead of focusing on one isolated month.

---

## 2️⃣ Revenue Contribution ≠ Profitability

Some states contributed a significant share of company revenue but did not necessarily generate strong profits.

**Maharashtra and Madhya Pradesh together contributed approximately 46% of total revenue.**

This demonstrated why revenue should always be analyzed together with profit and profit margin.

---

## 3️⃣ Losses Were Concentrated in Specific Locations

State-level analysis alone was not enough.

Further investigation showed that specific cities were responsible for significant portions of state-level losses.

This made city-level drill-down an important part of the analysis.

---

## 4️⃣ Different Locations Had Different Profitability Drivers

There was no single category or subcategory responsible for every business loss.

Different geographic areas showed different patterns.

Example:

```text
Madhya Pradesh
      ↓
Indore
      ↓
Furniture
      ↓
Tables & Chairs
```

while other locations showed different loss-making categories and subcategories.

---

## 5️⃣ High Negative Margin Does Not Always Mean Highest Business Impact

A segment may have a very poor profit margin but generate relatively little revenue.

Another segment may have a smaller negative margin but create a much larger absolute loss.

Therefore, prioritization should consider both:

```text
Profit/Loss Amount
        +
Profit Margin %
```

---

# 💼 Business Recommendations

## 1️⃣ Prioritize High-Loss Areas

Management should first focus on the states, cities, categories, and subcategories generating the largest absolute losses.

---

## 2️⃣ Investigate Product-Level Profitability

Products consistently generating negative profit should be identified and reviewed individually.

---

## 3️⃣ Review Pricing & Cost Structure

For the identified loss-making products, management should investigate additional financial information such as:

- Selling Price
- Procurement Cost
- Discounts
- Product Margins

This would help determine the exact financial reason behind negative profitability.

---

## 4️⃣ Monitor High-Revenue but Low-Profit Segments

High revenue should not automatically be considered good performance.

Segments with high revenue but weak profitability should receive additional attention.

---

## 5️⃣ Avoid Blanket Business Decisions

Since different locations have different profitability drivers, corrective actions should be targeted.

For example:

```text
City A → Category X → Subcategory Y
City B → Category Z → Subcategory P
```

Instead of applying the same solution across the entire company.

---

## 6️⃣ Establish Continuous Profitability Monitoring

Management should regularly monitor:

```text
Revenue
Profit
Profit Margin %
Revenue Contribution %
Quantity
Monthly Growth
Top Loss-Making Products
```

This can help detect profitability problems earlier.

---

# ⚠️ Data Limitation

The available dataset contains fields such as:

- Amount
- Profit
- Quantity
- State
- City
- Category
- Subcategory
- Product

However, explicit fields for:

- Cost
- Selling Price
- Procurement Price
- Discount

are not available.

Therefore, this analysis successfully identifies:

> **WHERE profitability problems are occurring**

but cannot conclusively determine:

> **WHY the underlying financial loss is occurring**

For example, the analysis cannot prove that a loss was caused specifically by high procurement costs, excessive discounts, or low selling prices.

Additional pricing and cost data would be required for deeper root-cause analysis.

---

# 🧠 What I Learned From Days 30–32

## 📅 Day 30

### Business Problem → SQL Investigation

I learned how to translate a business problem into structured analytical questions instead of writing random SQL queries.

---

## 📅 Day 31

### Advanced SQL → Business Impact

I learned how SQL concepts such as:

- `LAG()`
- Window Functions
- Running Totals
- Revenue Contribution %
- Month-over-Month Growth

can be used to answer real business questions.

---

## 📅 Day 32

### SQL Insights → Streamlit Dashboard

I learned how to convert SQL findings into an interactive dashboard that communicates business performance clearly.

---

# 🚀 Complete Analytical Journey

```text
BUSINESS PROBLEM
       ↓
DATA VALIDATION
       ↓
SQL ANALYSIS
       ↓
MONTHLY TREND ANALYSIS
       ↓
STATE ANALYSIS
       ↓
CITY ANALYSIS
       ↓
CATEGORY ANALYSIS
       ↓
SUBCATEGORY ANALYSIS
       ↓
PRODUCT ANALYSIS
       ↓
QUANTIFY BUSINESS IMPACT
       ↓
BUSINESS INSIGHTS
       ↓
RECOMMENDATIONS
       ↓
STREAMLIT DASHBOARD
```

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| **SQL** | Data analysis & business investigation |
| **MySQL** | Querying and analytical calculations |
| **Python** | Dashboard development |
| **Pandas** | Data manipulation |
| **Streamlit** | Interactive dashboard |
| **GitHub** | Version control & project documentation |

---

# 🌐 Explore the Project

### 🚀 Live Streamlit Dashboard

👉 [View E-Commerce Sales & Profitability Dashboard](https://ecommerce-sales-profitability-analysis.streamlit.app/)

### 💻 GitHub Repository

👉 [View Complete Project](https://github.com/sahilmurti07/ecommerce-sales-profitability-analysis)

---

# 📅 60-Day Data Analytics Roadmap

## ✅ Days 30–32 Completed

### Focus

**Business Analysis → Advanced SQL → Root-Cause Investigation → Business Insights → Streamlit Dashboard → Business Communication**

---

> ### 💡 Biggest Takeaway
>
> **A Data Analyst's job is not just to write SQL queries or create dashboards. The real value comes from understanding the business problem, asking the right questions, finding patterns in the data, quantifying their impact, and communicating insights that support better business decisions.**
