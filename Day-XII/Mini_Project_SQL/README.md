# 📊 Global E-Commerce & Manufacturing Analytics

An end-to-end data analytics and business intelligence project built on **Microsoft Fabric**, leveraging **Spark SQL** and **Medallion Lakehouse Architecture** to deliver strategic insights across supply chain unit economics, sales targets, customer retention, and portfolio optimization.

---

## 📑 Executive Presentation
👉 **[View the Full Presentation Report (Canva / PDF)](./presentation/Candy Distributor Analysis presentation.pdf)**

---

## 🏗️ Architecture & Data Pipeline
The project implements a **Medallion Data Architecture** within a Microsoft Fabric Lakehouse environment:
- **Bronze Layer (Raw Ingestion):** Ingested factory operations, product catalog, regional targets, and transactional sales logs (`bronze_factories`, `bronze_products`, `bronze_sales`, `bronze_targets`).
- **Silver Layer (Transformation & Cleaning):** Cleaned schemas, standardized date fields, and structured transaction history (`silver_sales_table`).
- **Gold Layer (Analytics & Business Views):** Materialized analytical views and KPI datasets powering executive reporting.

---

## 🏆 Core Business Problems & SQL Methodologies

### 1. Supply Chain & Factory Unit Economics
- **Business Question:** *Which manufacturing plants deliver the highest gross margins, and where are unit costs highest?*
- **Technique:** Multi-table joins, weighted margins, and cost-per-unit metrics.
- **SQL File:** [`sql_scripts/01_supply_chain_unit_economics.sql`](./sql_scripts/01_factory_efficiency.sql)

### 2. FY24 Target vs. Actual Attainment
- **Business Question:** *Which commercial divisions achieved their 2024 sales targets, and where are the variance deficits?*
- **Technique:** CTE aggregation, variance modeling, and conditional `CASE WHEN` attainment flags.
- **SQL File:** [`sql_scripts/02_target_vs_actual_2024.sql`](./sql_scripts/02_target_performance.sql)

### 3. Customer Segmentation & Churn Risk (RFM)
- **Business Question:** *Who are our high-value B2B distributors, and which accounts are at risk of churning?*
- **Technique:** `DATEDIFF()` recency tracking and multi-tier behavioral classification (`VIP Active`, `VIP At-Risk`, `Frequent Buyer`).
- **SQL File:** [`sql_scripts/03_customer_segmentation_rfm.sql`](./sql_scripts/03_customer_segmentation_rfm.sql)

### 4. Product Portfolio Optimization (Pareto 80/20)
- **Business Question:** *Which top 20% of candy SKUs generate 80% of top-line revenue?*
- **Technique:** Window functions (`SUM() OVER (ORDER BY ...)`), running totals, and SKU tiering.
- **SQL File:** [`sql_scripts/04_pareto_portfolio_optimization.sql`](./sql_scripts/04_pareto_portfolio_optimization.sql)

---

## 🛠️ Tech Stack & Tools
- **Platform:** Microsoft Fabric Lakehouse
- **Query Engine:** Spark SQL / T-SQL
- **Architecture:** Medallion Data Stack (Bronze / Silver / Gold)
- **Reporting & Design:** Canva Executive Deck / Looker Studio
