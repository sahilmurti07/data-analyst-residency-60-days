# Day 04 — From Data Pipeline to Data Warehouse

📅 Date: 04 August 2026

## Goal

Continue exploring Microsoft Fabric by understanding enterprise data pipeline orchestration and building a warehouse using dimensional modeling.

---

## What I Worked On

### 📌 Enterprise Data Pipeline Concepts

Today I explored how organizations ingest multiple source tables without creating separate pipelines for every table.

Learned two common approaches:

- **ForEach Activity**
  - Iterates through multiple source tables.
  - Executes the same Copy Data activity dynamically.
  - Useful for bulk ingestion.

- **Lookup Activity**
  - Reads metadata such as table names from JSON or a configuration table.
  - Passes the output into a ForEach activity.
  - Enables metadata-driven pipeline design.

This gave me a better understanding of how scalable ETL pipelines are designed.

---

### 🏗 Warehouse Development

Continued building the warehouse layer by creating a Star Schema.

Created:

- Dim_Date
- Dim_Customer
- Dim_Product
- Dim_Region
- Fact_Sales

While creating the Fact table, I encountered duplicate row issues caused by non-unique join keys and spent time debugging the dimensional model.

---

### 🧩 Data Modeling

Today's focus wasn't writing more SQL—it was understanding **how tables should relate to each other**.

Learned:

- Difference between Fact and Dimension tables
- Importance of surrogate keys
- Why unique business keys matter
- How improper joins can multiply fact records

---

### 💻 SQL Practice

Continued solving business-oriented SQL problems on StrataScratch.

Practiced:

- Aggregations
- Joins
- Window Functions
- Business KPI calculations

---

## Challenges Faced

- Duplicate rows while creating Fact table
- Understanding customer dimension uniqueness
- Delta schema mismatch during table overwrite
- Debugging join logic in PySpark

---

## Key Takeaways

- Enterprise pipelines are metadata-driven.
- Lookup + ForEach makes pipelines reusable.
- Star Schema is the foundation of BI reporting.
- Fact tables should never increase row count because of incorrect joins.
- Designing the data model is just as important as writing transformation logic.

---

## Tech Stack

- Microsoft Fabric
- Data Pipeline
- Warehouse
- SQL
- PySpark
- Delta Lake
- StrataScratch

---

## Progress

✅ Bronze Layer

✅ Silver Layer

✅ Gold Layer

✅ Warehouse

✅ Star Schema (In Progress)

⬜ Semantic Model

⬜ Power BI Dashboard
