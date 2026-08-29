# Day 29 — Real-World SQL Investigation

> **60-Day Data Analytics Journey | Day 29**

Today I moved from learning SQL functions to practicing **how a Data Analyst investigates a real business problem**.

Instead of starting with a random SQL question, I simulated a company environment where a manager gives a business problem and the analyst has to investigate it step by step.

---

## 🏢 Business Scenario

I simulated the role of a **Junior Data Analyst at an e-commerce company**.

The manager reported:

> **“February revenue is down compared with January. Find where the decline is happening and what is driving it.”**

The important part was not just finding the decline, but understanding **where the problem was concentrated and how to drill down into it**.

---

# 🎯 Investigation Approach

I followed a structured drill-down approach:

```text
Company
   ↓
Region
   ↓
Customer Segment
   ↓
Product Category
   ↓
Customer
   ↓
Orders vs AOV
```

This helped me move from a broad business problem to a specific analytical finding.

---

# 1. Validate the Reported Problem

Before investigating, I first validated the reported revenue decline.

### Metrics analysed

- January Revenue
- February Revenue
- Revenue Change
- Revenue Change %
- January Orders
- February Orders
- Order Change %
  
### SQL Concepts Used

```text
SUM()
COUNT(DISTINCT)
CASE
GROUP BY
CTE
```

---

# 2. Find WHERE the Decline Is Happening

The next step was to break the revenue down by region.

```text
Company
   ↓
Region
```

For each region, I compared:

```text
January Revenue
February Revenue
Revenue Change
Revenue Change %
```

### Finding

The **North region** showed the largest revenue decline.

This gave the next investigation path:

```text
Overall Revenue Decline
        ↓
North Region
```

---

# 3. Find WHO Is Affected

Inside the North region, I analysed revenue by customer segment.

```text
North
  ↓
Customer Segment
```

The segments were compared using:

```text
Jan Revenue
Feb Revenue
Revenue Change
Revenue Change %
```

### Finding

The **Corporate segment** showed the largest percentage decline.

So the analysis moved to:

```text
North
   ↓
Corporate
```

---

# 4. Find WHAT Is Driving the Decline

Inside the Corporate segment, I drilled down into product categories.

```text
North
   ↓
Corporate
   ↓
Product Category
```

Each category was compared using January and February revenue.

### Finding

The **Electronics category** showed the largest percentage decline.

The investigation path became:

```text
North
   ↓
Corporate
   ↓
Electronics
```

---

# 5. Orders vs AOV

At this point, I wanted to understand **what changed inside Electronics**.

Instead of looking only at revenue, I compared:

- Total Orders
- Revenue
- Average Order Value (AOV)

### Formula

```text
AOV = Revenue / Total Orders
```

### Example Analysis

```text
Orders
January → February
        ↓
Declined

AOV
January → February
        ↓
Increased
```

### Key Learning

Revenue can decline even when AOV increases if the number of orders falls enough.

```text
Orders ↓
AOV ↑
   ↓
Revenue can still ↓
```

This helped separate **order volume** from **average value per order**.

---

# 6. Customer-Level Drill Down

After identifying Electronics as the declining category, I moved to customer-level analysis.

For each customer, I calculated:

```text
Customer
Jan Revenue
Feb Revenue
Revenue Change
Revenue Change %
```

This allowed me to identify customers with the largest revenue losses.

---

# 7. Ranking Declining Customers

To identify the biggest revenue-loss customers, I used:

```sql
RANK() OVER (
    ORDER BY revenue_change ASC
)
```

### Why ASC?

Because the most negative value represents the largest revenue decline.

```text
-20,000
-15,000
-10,000
```

Therefore:

```text
More Negative
      ↓
Larger Revenue Loss
```

This allowed me to identify the **Top 5 customers with the largest revenue decline**.

---

# 8. Quantifying Customer Impact

After identifying the Top 5 declining customers, the next question was:

> **How much of the total category decline came from these customers?**

The analysis compares:

```text
Top 5 Customer Revenue Decline
                ÷
Total Electronics Revenue Decline
                × 100
```

This helps determine whether the decline is:

### Broad

Many customers contributed to the decline.

### Concentrated

A small number of customers contributed most of the decline.

---

# 🔗 Final Investigation Flow

```text
Revenue Decline
      ↓
North Region
      ↓
Corporate Segment
      ↓
Electronics Category
      ↓
Orders vs AOV
      ↓
Customer-Level Analysis
      ↓
Top Declining Customers
      ↓
Measure Their Contribution
```

---

# 🧠 Key Analyst Learning

The biggest lesson from today was that a real Data Analyst should not stop after finding the first decline.

Instead:

```text
Problem
   ↓
Validate
   ↓
Locate
   ↓
Drill Down
   ↓
Quantify
   ↓
Interpret
```

A business problem usually requires multiple levels of investigation.

---

# 🛠️ SQL Skills Practiced

- `JOIN`
- `GROUP BY`
- `CASE`
- CTEs
- Subqueries
- `LAG()`
- `PARTITION BY`
- `RANK()`
- `SUM()`
- `COUNT(DISTINCT)`
- Percentage Change
- AOV Calculation
- Customer-Level Analysis
- Drill-Down Analysis

---

# 💡 Important Business Thinking

Today I learned the difference between:

> **Finding the problem**

and

> **Finding what is contributing to the problem**

For example:

```text
Revenue ↓
```

is only the starting point.

A better analysis is:

```text
Revenue ↓
→ North ↓
→ Corporate ↓
→ Electronics ↓
→ Orders ↓
→ Identify affected customers
```

This creates a much more useful business story.

---

# 🎯 Day 29 Takeaway

> **A Data Analyst does not stop at “what happened?” — the next step is to understand where it happened, who was affected, and what measurable pattern is associated with it.**

```text
Validate → Locate → Drill Down → Quantify → Communicate
```

---

## 📅 60-Day Data Analytics Journey

**Day 29 ✅ — Real-World SQL Business Investigation**

> **From SQL queries to structured business problem-solving.**
