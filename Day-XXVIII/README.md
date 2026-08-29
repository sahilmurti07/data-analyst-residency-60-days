# Day 28 — Advanced SQL Window Functions

> **60-Day Data Analytics Journey | Day 28**

Today I focused on understanding **SQL Window Functions** through a realistic e-commerce business scenario.

Instead of only learning syntax, I practiced how window functions are used to answer real business questions around customer analytics, ranking, segmentation, and distribution.

---

## 🎯 Today's Goal

Understand how to use SQL Window Functions for:

- Ranking
- Bucketing
- Percentile analysis
- Cumulative analysis
- Customer segmentation

---

## 🏢 Business Scenario

I simulated the role of a **Junior Data Analyst at an e-commerce company**.

The business wanted to understand customer value and identify high-value customers.

The analysis focused on questions such as:

- Who are the top customers?
- How do customers rank against each other?
- Which spending bucket does a customer belong to?
- Which customers fall into the top 10%?
- Where does a customer stand within the overall distribution?

---

# 📚 Window Functions Covered

## 1. ROW_NUMBER()

Used when every row needs a unique position.

```sql
ROW_NUMBER() OVER (
    ORDER BY total_spend DESC
)
```

### Example

```text
Customer A → 1
Customer B → 2
Customer C → 3
```

Even when values are tied, every row receives a unique number.

---

## 2. RANK()

Used to rank rows while allowing ties.

```sql
RANK() OVER (
    ORDER BY total_spend DESC
)
```

### Example

```text
1
2
2
4
```

When two rows have the same value, they receive the same rank and the next rank is skipped.

---

## 3. DENSE_RANK()

Used to rank rows while allowing ties without gaps.

```sql
DENSE_RANK() OVER (
    ORDER BY total_spend DESC
)
```

### Example

```text
1
2
2
3
```

### Difference

| Function | Example with ties |
|---|---|
| `RANK()` | 1, 2, 2, 4 |
| `DENSE_RANK()` | 1, 2, 2, 3 |

---

# 4. NTILE()

Used to divide ordered rows into approximately equal groups.

```sql
NTILE(4) OVER (
    ORDER BY total_spend DESC
)
```

### Common Uses

```text
NTILE(4)  → Quartiles
NTILE(5)  → Quintiles
NTILE(10) → Deciles
```

---

## 📊 Understanding Deciles

`NTILE(10)` divides the dataset into **10 approximately equal groups**.

```text
Decile 1  → Top 10%
Decile 2  → 10–20%
Decile 3  → 20–30%
Decile 4  → 30–40%
Decile 5  → 40–50%
Decile 6  → 50–60%
Decile 7  → 60–70%
Decile 8  → 70–80%
Decile 9  → 80–90%
Decile 10 → Bottom 10%
```

### Example

```sql
SELECT
    customer_id,
    customer_name,
    total_spend,
    NTILE(10) OVER (
        ORDER BY total_spend DESC
    ) AS spending_decile
FROM customers;
```

This can help identify:

- Top 10% customers
- Top 20% customers
- Bottom 10% customers
- High-value customer groups

---

# 5. PERCENT_RANK()

Used to understand the relative position of a row within an ordered dataset.

```sql
PERCENT_RANK() OVER (
    ORDER BY total_spend
)
```

The result ranges from:

```text
0 → Lowest relative position
1 → Highest relative position
```

### Business Question

> Where does this customer stand compared with the rest of the customers?

---

# 6. CUME_DIST()

Used to understand the cumulative distribution of rows.

```sql
CUME_DIST() OVER (
    ORDER BY total_spend
)
```

### Business Question

> What percentage of customers have spending less than or equal to this customer's spending?

For example:

```text
CUME_DIST = 0.90
```

means approximately **90% of customers are at or below that customer's spending level**.

---

# 🔄 NTILE vs PERCENT_RANK vs CUME_DIST

| Function | Main Question |
|---|---|
| `NTILE()` | Which bucket does this row belong to? |
| `PERCENT_RANK()` | Where does this row stand in the ranking? |
| `CUME_DIST()` | What percentage of rows are at or below this value? |

---

# 🧠 Understanding PARTITION BY

One of the most important concepts I practiced was using window functions separately within groups.

Example:

```sql
NTILE(5) OVER (
    PARTITION BY region
    ORDER BY total_spend DESC
)
```

This means the bucketing restarts for every region.

```text
North
 └── Top 20%

South
 └── Top 20%

East
 └── Top 20%

West
 └── Top 20%
```

This is useful when analysis needs to be performed **within each business group rather than across the entire dataset**.

---

# 🧪 Business Use Case — Customer Segmentation

A company may want to identify its highest-value customers.

```sql
SELECT
    customer_id,
    customer_name,
    total_spend,
    NTILE(10) OVER (
        ORDER BY total_spend DESC
    ) AS spending_decile
FROM customers;
```

This allows the business to identify:

```text
Top 10% Customers
Top 20% Customers
Bottom 10% Customers
```

---

# 🔗 Connection With RFM Analysis

Window functions can also support **RFM customer segmentation**.

## RFM

```text
R = Recency
F = Frequency
M = Monetary
```

`NTILE(5)` can be used to create scores for each dimension.

### Monetary

```sql
NTILE(5) OVER (
    ORDER BY total_spend ASC
)
```

### Frequency

```sql
NTILE(5) OVER (
    ORDER BY purchase_count ASC
)
```

### Recency

For recency, fewer days since the last purchase is generally better, so the ordering direction needs to reflect that scoring logic.

The resulting scores can be combined into an RFM score:

```text
R Score + F Score + M Score
```

Example:

```text
555 → High-value / highly engaged
111 → Low-value / low engagement
```

---

# 🧩 CTE / Subquery + Window Function

I also practiced the common SQL pattern:

```text
Calculate
    ↓
Window Function
    ↓
CTE / Subquery
    ↓
Filter / Analyze
```

### Example — Top 10% Customers

```sql
SELECT *
FROM (
    SELECT
        customer_id,
        customer_name,
        total_spend,
        NTILE(10) OVER (
            ORDER BY total_spend DESC
        ) AS spending_decile
    FROM customers
) t
WHERE spending_decile = 1;
```

The inner query creates the decile.

The outer query filters the required bucket.

---

# 📈 Cumulative Analysis

I also learned the difference between:

## Running / Cumulative Total

```sql
SUM(total_spend) OVER (
    ORDER BY total_spend DESC
)
```

This produces a running total.

## Cumulative Distribution

```sql
CUME_DIST() OVER (
    ORDER BY total_spend
)
```

This describes the cumulative position of a row within the dataset.

### Simple Difference

```text
SUM() OVER()
→ Cumulative amount

CUME_DIST()
→ Cumulative position / distribution
```

---

# 🔥 Practical SQL Example

Multiple window functions can also be used together:

```sql
SELECT
    customer_id,
    customer_name,
    total_spend,

    ROW_NUMBER() OVER (
        ORDER BY total_spend DESC
    ) AS row_number,

    RANK() OVER (
        ORDER BY total_spend DESC
    ) AS spending_rank,

    DENSE_RANK() OVER (
        ORDER BY total_spend DESC
    ) AS dense_spending_rank,

    NTILE(4) OVER (
        ORDER BY total_spend DESC
    ) AS spending_quartile,

    NTILE(10) OVER (
        ORDER BY total_spend DESC
    ) AS spending_decile,

    PERCENT_RANK() OVER (
        ORDER BY total_spend
    ) AS percent_rank,

    CUME_DIST() OVER (
        ORDER BY total_spend
    ) AS cumulative_distribution

FROM customers;
```

This produces a single analytical output containing different views of the customer's position.

---

# 💡 Key Learning

The biggest lesson from today was:

> **Window functions are not just SQL syntax. They help answer analytical questions while keeping the original rows available.**

Instead of only asking:

> "What is the total?"

I can now ask:

> "Where does this customer rank?"

> "Which bucket does this customer belong to?"

> "What percentage of customers are below this customer?"

> "Who belongs to the top 10%?"

---

# 🛠️ Skills Practiced

- SQL Window Functions
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `NTILE()`
- `PERCENT_RANK()`
- `CUME_DIST()`
- `PARTITION BY`
- `ORDER BY`
- CTEs
- Subqueries
- Customer Segmentation
- Percentile Analysis
- Deciles
- Quartiles
- Cumulative Analysis
- RFM Concepts

---

# 🎯 Day 28 Takeaway

```text
RANK()
→ Who is #1, #2, #3?

NTILE()
→ Which bucket am I in?

PERCENT_RANK()
→ Where am I in the ranking?

CUME_DIST()
→ What percentage of rows are at or below me?

SUM() OVER()
→ What is the running total?
```

---

# 🚀 Next Step

The goal is to move beyond learning SQL functions individually and start combining them to solve realistic business problems.

```text
Business Question
        ↓
Choose the right SQL technique
        ↓
Write the query
        ↓
Validate the result
        ↓
Interpret the result
        ↓
Communicate the insight
```

> **Learn the function → understand the business question → choose the right SQL technique → interpret the result.**

---

## 📅 60-Day Data Analytics Journey

**Day 28 ✅ — Advanced SQL Window Functions**
```We need maybe user wants only README no extra prose. final with code block only. Need avoid claim maybe source? It's their own day. Fine. Also maybe "over 8,000" data irrelevant. Let's deliver.
