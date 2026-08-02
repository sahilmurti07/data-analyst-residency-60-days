# 🚀 Day 02 – Building My First End-to-End Data Pipeline in Microsoft Fabric

> **Date:** 02 August 2026  
> **Duration:** 9:30 AM – 5:00 PM  
> **Focus:** Microsoft Fabric | Medallion Architecture | Data Pipeline | PySpark | SQL

---

# 🎯 Objective

Today's objective was to gain hands-on experience with Microsoft Fabric by building a complete data ingestion and transformation pipeline using the Medallion Architecture.

Instead of learning concepts theoretically, I focused on implementing every step of the workflow—from data ingestion to creating Bronze and Silver Delta tables.

---

# 💼 Work Completed

## 1. Built a Microsoft Fabric Data Pipeline

Designed an end-to-end pipeline to automate the movement of sales data.

Pipeline Flow:

HTTP Source
⬇
Copy Data Activity
⬇
Lakehouse
⬇
Notebook (Bronze Layer)
⬇
Notebook (Silver Layer)

---

## 2. Data Ingestion

- Imported sales data from an HTTP source.
- Used **Copy Data** activity to load the raw dataset into a Microsoft Fabric Lakehouse.
- Verified successful ingestion before starting transformations.

---

## 3. Bronze Layer

Created my first PySpark notebook to:

- Read raw CSV data from the Lakehouse
- Convert it into a Delta table
- Store it as the Bronze layer

Example Workflow:

Raw CSV
⬇
PySpark Notebook
⬇
Delta Table
⬇
Bronze Sales Table

---

## 4. Silver Layer

Created a second notebook to transform the Bronze table into a Silver table.

Transformations included:

- Data type conversion
- Calculated columns
- Basic data cleaning
- Writing transformed data back as a Delta table

---

## 5. Medallion Architecture

Today's implementation followed the Medallion Architecture:

Raw Data
⬇
Bronze (Raw Delta)
⬇
Silver (Cleaned & Transformed)
⬇
Gold (Future Business Layer)

This helped me understand how enterprise data platforms organize and process data efficiently.

---

## 6. Challenges Faced

During development, I encountered:

- Delta Lake schema merge errors (`DELTA_FAILED_TO_MERGE_FIELDS`)
- Date formatting issues while converting string columns into date types
- Understanding the difference between Python, Pandas, and PySpark in Microsoft Fabric

Resolving these issues improved my understanding of Spark and Delta Lake behavior.

---

## 7. SQL Practice

Around **4:00 PM**, I switched to SQL interview preparation.

Solved multiple StrataScratch business problems involving:

- Window Functions
- DENSE_RANK()
- LAG()
- CTEs
- JOINs
- Aggregations

The problems focused on business scenarios rather than syntax, helping improve analytical thinking.

---

# 📚 Key Learnings

Today I learned:

- How Microsoft Fabric orchestrates data pipelines.
- The role of Lakehouse in modern analytics.
- How PySpark notebooks interact with Delta tables.
- Why Medallion Architecture is widely adopted in enterprise data engineering.
- The importance of schema consistency when working with Delta Lake.
- Window functions remain one of the most valuable SQL concepts for solving analytical business problems.

---

# 🛠️ Technologies Used

- Microsoft Fabric
- Lakehouse
- Data Pipeline
- PySpark
- Delta Lake
- SQL
- StrataScratch

---

# 📸 Artifacts

- Fabric Pipeline
- Bronze Notebook
- Silver Notebook
- SQL Practice (StrataScratch)

---

# 💭 Reflection

Today felt like my first experience working with a modern data platform rather than simply practicing SQL.

Building the pipeline from ingestion to transformation gave me a much better understanding of how data moves through an enterprise analytics system. I also realized that debugging Spark and Delta Lake issues is an important part of the workflow and often teaches more than following a tutorial.

Ending the day with SQL business problems reinforced the analytical skills needed to interpret and answer real business questions.

---

## 📈 Progress

✅ Day 02 Completed

Current Focus:
- Microsoft Fabric
- Data Pipelines
- Medallion Architecture
- PySpark
- SQL Problem Solving

Tomorrow's Goal:
- Build a more robust Silver layer with additional transformations and data quality checks, or continue exploring Gold-layer reporting.
