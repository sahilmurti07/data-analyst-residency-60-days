# 🚀 Day 8/60 — Silver to Gold Layer & Business Analysis

> **Project:** Failed Orders & Cancellation Pattern Analysis  
> **Platform:** Microsoft Fabric  
> **Architecture:** Medallion Architecture  
> **Focus:** Data Cleaning → Transformation → Business Analysis

---

## 📌 Overview

Today I continued developing my end-to-end data engineering project in **Microsoft Fabric**.

The main objective was to complete the **Silver Layer transformation** and move the cleaned data into the **Gold Layer**, where the data can be used for business-focused analysis.

The project is based on analyzing **failed orders and cancellation patterns**. Instead of only cleaning the data, I started thinking about the actual business questions that can be answered from the dataset.

The overall workflow is now moving from:

```text
Raw Data
   ↓
Bronze Layer
   ↓
Data Cleaning & Transformation
   ↓
Silver Layer
   ↓
Business Aggregation & Analysis
   ↓
Gold Layer
   ↓
Visualization & Business Insights
```

---

# 🥈 1. Silver Layer — Data Cleaning & Transformation

The Bronze layer contained the raw data ingested through the Microsoft Fabric pipeline.

Today I worked on transforming this raw data into a cleaner and more analysis-ready Silver table.

### 🔹 Silver Table

The main Silver table created during the transformation was:

```text
silver_orders_table
```

The table contains cleaned information related to orders, including:

- `order_gk`
- `offer_id`
- `order_time`
- `origin_longitude`
- `origin_latitude`
- `m_order_eta`
- `cancellations_time_in_seconds`
- `order_status`
- `driver_assign`
- `hours`

### 🔹 Data Cleaning

During the transformation process, I worked on:

- Removing unnecessary columns.
- Removing duplicate records.
- Selecting only the columns required for analysis.
- Checking data types.
- Converting and preparing timestamp-related fields.
- Creating an `hours` column from the order timestamp.
- Creating readable order-status values.
- Preparing the dataset for business analysis.

Example transformation:

```python
df_summary = df_summary.dropDuplicates()
```

The cleaned dataset was then written back to the Lakehouse as a Delta table:

```python
df_summary.write \
    .format("delta") \
    .mode("overwrite") \
    .saveAsTable("Silver_Orders_Table")
```

---

# 🥇 2. Gold Layer — Business Analysis

After completing the Silver Layer, I loaded the cleaned data into a separate **Silver → Gold notebook**.

The purpose of the Gold Layer is different from the Silver Layer.

The Silver Layer focuses mainly on:

> **"Is the data clean and structured?"**

While the Gold Layer focuses on:

> **"What business questions can we answer using this data?"**

---

## 📊 Business Problem

The project focuses on understanding:

> **Why are orders failing or getting cancelled, and when do these failures occur most frequently?**

The analysis is particularly focused on cancellation behavior and operational factors.

---

# 🔍 3. Initial Business Analysis

I started creating grouped summaries to understand order behavior across different dimensions.

### Analysis Dimensions

Some of the dimensions explored include:

```text
Order Hour
Driver Assignment
Order Status
ETA
Cancellation Time
```

For example, I created an hourly summary:

```python
df_hours_summary = (
    df_summary
    .groupby(
        "hours",
        "driver_assign",
        "order_status"
    )
    .agg(
        count("order_gk").alias("Orders")
    )
)
```

This allows me to understand how the number of orders changes according to:

- Hour of the day
- Whether a driver was assigned
- Whether the order was cancelled or system rejected

---

# ⏰ 4. Cancellation Timing Analysis

One of the interesting areas I started investigating was the relationship between:

```text
ETA
        ↓
Customer Waiting Time
        ↓
Cancellation
```

For example, if:

```text
ETA = 671 seconds
Average Cancellation Time = 305 seconds
```

then:

```text
305 / 671 × 100
≈ 45.5%
```

This means that, on average, the order was cancelled after approximately **45.5% of the estimated delivery time**.

This does not necessarily prove that ETA causes cancellation, but it provides an important hypothesis to investigate further.

### Business Hypothesis

> Orders may have a higher probability of cancellation when customers wait for a significant proportion of the estimated delivery time without receiving a successful ride match.

This will be tested further using visualizations and additional analysis.

---

# 🚗 5. Driver Assignment Analysis

Another important dimension is **driver assignment**.

I started comparing:

```text
Driver Assigned
vs
Driver Not Assigned
```

against:

```text
Cancelled
vs
System Reject
```

This helps identify whether failed orders are primarily related to:

- Driver availability
- Matching problems
- Customer waiting time
- System rejection
- Operational workload

This is important because simply looking at the total number of cancellations does not explain **why** those cancellations occurred.

---

# 📈 6. Moving From Data to Insights

The next stage of the project is to move beyond SQL/PySpark tables and create visual analysis.

The goal is to identify patterns such as:

### Time-Based Patterns

```text
Which hours have the highest cancellation volume?
```

### Cancellation Rate

```text
At which hours are customers most likely to cancel?
```

### Driver Assignment

```text
Does driver assignment have a relationship with cancellation?
```

### ETA Analysis

```text
Does a higher ETA correspond with higher cancellation behavior?
```

### Waiting Time

```text
How long do customers typically wait before cancelling?
```

---

# 📊 7. Planned Visualizations

Tomorrow I will create visualizations to make these patterns easier to understand.

Planned charts include:

### 1. Orders by Hour

```text
Hour → Number of Orders
```

This will identify periods with high order activity.

### 2. Cancellation by Hour

```text
Hour → Cancelled Orders
```

This will show when the highest number of cancellations occurs.

### 3. Cancellation Rate by Hour

```text
Hour → Cancellation Rate %
```

This is more useful than cancellation volume because it considers the total number of orders.

### 4. Driver Assignment vs Cancellation

```text
Driver Assigned
        ↓
Cancellation Rate
```

This will help investigate potential driver-matching issues.

### 5. ETA vs Cancellation Time

```text
Average ETA
     vs
Average Cancellation Time
```

This can help identify whether customers are cancelling after waiting for a significant portion of their expected delivery time.

---

# 🧠 Key Learning From Day 8

Today I learned that building a data engineering project is not only about moving data from one layer to another.

The real purpose of the architecture is to gradually transform data into something useful for decision-making.

```text
Bronze
Raw Data
   ↓
Silver
Clean & Structured Data
   ↓
Gold
Business-Ready Data
   ↓
Visualization
   ↓
Insights
   ↓
Business Recommendations
```

This helped me understand the connection between **Data Engineering and Data Analytics**.

The pipeline prepares reliable data, while the analytical layer helps answer business questions.

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| **Microsoft Fabric** | Data Engineering Platform |
| **Data Pipeline** | Data ingestion and orchestration |
| **Lakehouse** | Data storage |
| **Delta Lake** | Table storage format |
| **PySpark** | Data cleaning and transformation |
| **SQL** | Business analysis |
| **Medallion Architecture** | Data layer organization |
| **StrataScratch** | SQL interview practice |

---

# 🏗️ Current Project Architecture

```text
                 API / Source Data
                        │
                        ▼
              ┌───────────────────┐
              │   Fabric Pipeline │
              │     ForEach       │
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │   🥉 Bronze       │
              │   Raw Delta Data  │
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │   PySpark         │
              │ Cleaning &        │
              │ Transformation    │
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │   🥈 Silver       │
              │ Cleaned Orders    │
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │   Gold Notebook   │
              │ Business Analysis │
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │   🥇 Gold         │
              │ Business-Ready    │
              │ Data              │
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │ 📊 Visualization  │
              │ & Insights         │
              └─────────┬─────────┘
                        │
                        ▼
              ┌───────────────────┐
              │ 💡 Business       │
              │ Recommendations   │
              └───────────────────┘
```

---

# 📅 Project Progress

| Component | Status |
|---|---|
| API Data Ingestion | ✅ Completed |
| ForEach Pipeline | ✅ Completed |
| Bronze Layer | ✅ Completed |
| Bronze → Silver Transformation | ✅ Completed |
| Silver Data Cleaning | ✅ Completed |
| Silver → Gold Notebook | ✅ Completed |
| Gold Business Analysis | 🔄 In Progress |
| Visualizations | ⏳ Next |
| Business Insights | ⏳ Next |
| Business Recommendations | ⏳ Next |

---

# 🎯 Day 9 Plan

Tomorrow the focus will shift from **data preparation to data storytelling**.

I will:

- Build charts from the Gold-layer data.
- Analyze cancellation patterns.
- Compare cancellation rates across different hours.
- Investigate driver assignment behavior.
- Analyze ETA and cancellation timing.
- Identify the strongest business patterns.
- Convert those patterns into actionable recommendations.

> **Day 8 complete — the data is now clean, transformed, and ready to tell the business story. 🚀📊**
