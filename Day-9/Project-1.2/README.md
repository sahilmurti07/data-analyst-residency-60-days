# 📊 Day 9/60 — Business Analysis & Cancellation Pattern Investigation

> **Project:** Car Order Cancellation & Failure Analysis  
> **Platform:** Microsoft Fabric  
> **Focus:** Gold Layer → Business Analysis → Insight Discovery

---

## 📌 Overview

Day 9 was focused on moving from **data preparation to actual business analysis**.

After completing the Bronze and Silver layers, I worked on the Gold-layer analysis to understand the main business problem:

> **Why are car orders getting cancelled or rejected by the system?**

Instead of immediately creating random visualizations, I structured the analysis around business questions and identified relationships that could potentially explain the failure patterns.

---

## 🔍 Business Problem

The dataset contains two major failure outcomes:

- `Cancelled`
- `System Reject`

The objective is to understand:

- When do cancellations happen more frequently?
- Is driver assignment related to order failure?
- Does ETA have a relationship with cancellation?
- How long do customers wait before cancelling?
- Are certain hours associated with higher cancellation rates?
- Are there combinations of factors where cancellation becomes particularly high?

---

## 📊 Analysis Performed

### 1. Overall Failure Analysis

Started by establishing the baseline:

```text
Total Failed Orders
        ↓
Cancelled Orders
        ↓
System Reject Orders
        ↓
Cancellation Rate
        ↓
System Reject Rate
```

This helped determine whether the main issue was customer cancellation or system rejection.

---

### 2. Cancellation Analysis by Hour

Created hourly aggregations using PySpark:

```python
df.groupBy("hours").agg(...)
```

The purpose was to distinguish between:

- **Cancellation Volume** → How many orders were cancelled?
- **Cancellation Rate** → What percentage of failed orders were cancellations?

This distinction is important because a high number of cancellations does not necessarily mean that an hour has the highest cancellation risk.

---

### 3. Driver Assignment Analysis

Investigated the relationship between:

```text
Driver Assignment
        ↓
Order Status
```

This revealed a very strong difference between orders with and without driver assignment.

Orders with a driver assigned were overwhelmingly classified as `Cancelled`, while `System Reject` was overwhelmingly associated with orders where a driver was not assigned.

This became one of the major areas for further investigation.

> **Important:** This is an association, not proof that driver assignment causes cancellation.

---

### 4. ETA Analysis

Started investigating whether estimated delivery time is related to cancellation behavior.

Created:

```text
ETA in Minutes
```

and analyzed:

```text
ETA Bucket
      ↓
Cancellation Rate
```

Example ETA buckets:

```text
0–5 min
5–10 min
10–15 min
15–20 min
20+ min
```

The goal is to determine whether longer estimated delivery times are associated with higher cancellation rates.

---

### 5. Cancellation Waiting Time

Analyzed:

```text
Cancellation Time
```

to understand how long customers wait before cancelling an order.

The analysis compares:

```text
ETA
  vs
Cancellation Time
```

This helps investigate whether customers cancel before reaching their expected delivery time.

---

### 6. ETA Utilization

Created a new analytical metric:

```text
ETA Utilization =
Cancellation Time / ETA × 100
```

For example:

```text
ETA = 671 seconds
Cancellation Time = 305 seconds

ETA Utilization = 45.5%
```

This means the cancellation happened after approximately 45.5% of the estimated delivery window.

Created buckets:

```text
0–25%
25–50%
50–75%
75–100%
100%+
```

The objective is to understand whether cancellation probability increases as customers approach or exceed their expected delivery time.

---

## 🧠 Analytical Approach

Instead of looking at isolated charts, I structured the investigation as:

```text
Business Problem
      ↓
Overall Failure Analysis
      ↓
When? → Hour Analysis
      ↓
What? → Driver Assignment
      ↓
How Long? → Cancellation Time
      ↓
Expected Time? → ETA
      ↓
ETA Utilization
      ↓
Combined Analysis
      ↓
Business Insight
      ↓
Recommendation
```

---

## 📈 Planned Visualizations

The next stage is to convert the analytical tables into meaningful visualizations.

Planned charts include:

- Cancellation Rate by Hour
- Driver Assignment vs Order Status
- ETA Bucket vs Cancellation Rate
- ETA vs Cancellation Time
- ETA Utilization vs Cancellation Rate
- Hour × Driver Assignment analysis
- Geographic cancellation analysis

---

## 💡 Key Learning

The biggest learning from Day 9 was that **finding insights is not about creating as many charts as possible**.

A good analysis starts with a business question and then identifies the relationships required to answer it.

The investigation is moving from:

```text
"What happened?"
        ↓
"When did it happen?"
        ↓
"What factors are associated with it?"
        ↓
"Why might it be happening?"
        ↓
"What should the business investigate?"
```

---

## 🛠️ Technologies Used

- Microsoft Fabric
- PySpark
- SQL
- Lakehouse
- Delta Lake
- Medallion Architecture
- Data Analysis
- Business Analytics

---

## 📅 Next Step

The next stage is to visualize the strongest relationships and convert them into:

**Patterns → Insights → Business Impact → Recommendations**

The goal is not just to identify that cancellations are high, but to understand **what operational factors are most strongly associated with those cancellations.**

---

### 🚀 Day 9 Complete

**From Gold-layer data to structured business investigation.**

The project is now moving from **data engineering → analytics → business problem solving.**
