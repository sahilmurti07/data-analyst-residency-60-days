# 🚀 Day 7 — Dynamic Data Ingestion Pipeline with Microsoft Fabric

> **Project:** End-to-End Data Engineering Project  
> **Architecture:** Medallion (Bronze → Silver → Gold)

---

## 📖 Project Overview

Today's goal was to build a **dynamic data ingestion pipeline** in **Microsoft Fabric** that can automatically ingest multiple datasets from an API into a Lakehouse. Instead of creating separate Copy Data activities, I implemented a reusable solution using a **ForEach Loop**, making the pipeline scalable and production-friendly.

After successfully ingesting the data, I began building the **Bronze → Silver transformation notebook** using **PySpark**.

---

## 🛠️ What I Accomplished

### 📥 Data Ingestion
- Built a Microsoft Fabric Data Pipeline.
- Configured API-based data ingestion.
- Implemented a **ForEach Loop** to ingest multiple datasets dynamically.
- Stored all raw datasets as **Delta Tables** in the Bronze Layer.

---

### 🥉 Bronze Layer
- Successfully loaded multiple datasets into the Lakehouse.
- Verified schemas and row counts.
- Stored data in Delta format for optimized processing.

---

### 🥈 Bronze → Silver Transformation
Started building the transformation notebook using **PySpark**.

Current work includes:
- Reading Bronze Delta tables
- Exploring data
- Data cleaning
- Preparing transformed datasets for the Silver layer

---

### 💻 SQL Practice
Continued solving business-oriented SQL interview questions on **StrataScratch**.

#### Topics Practiced
- Window Functions
- CASE WHEN
- Conditional Aggregation
- Ranking Functions
- Business Logic
- Analytical SQL Queries

---

## 🧰 Tech Stack

| Category | Technology |
|----------|------------|
| Cloud Platform | Microsoft Fabric |
| Orchestration | Data Pipeline |
| Data Ingestion | Copy Data + ForEach |
| Storage | Lakehouse |
| Format | Delta Lake |
| Processing | PySpark |
| Query Language | SQL |
| Practice Platform | StrataScratch |

---

## 📚 Key Learnings

- Built a reusable pipeline using **ForEach Activity**.
- Learned how to automate ingestion of multiple datasets.
- Worked with Delta Tables inside a Lakehouse.
- Started implementing the **Bronze → Silver** transformation layer.
- Improved SQL problem-solving through real business interview questions.

---

## 📌 Current Project Progress

| Layer | Status |
|--------|--------|
| ✅ Data Ingestion | Completed |
| ✅ Bronze Layer | Completed |
| 🔄 Silver Layer | In Progress |
| ⏳ Gold Layer | Pending |
| ⏳ Power BI Dashboard | Pending |

---

## 📂 Folder Structure

```text
Project
│
├── Pipeline
│   └── Dynamic API Ingestion (ForEach)
│
├── Lakehouse
│   ├── Bronze Tables
│   └── Silver Tables (In Progress)
│
├── Notebooks
│   ├── Load to Delta
│   └── Bronze to Silver
│
└── SQL Practice
    └── StrataScratch
```

---

## 🎯 Next Steps

- Complete the Silver Layer transformations.
- Build Dimension and Fact tables.
- Create the Gold Layer with business-ready datasets.
- Design an interactive Power BI dashboard.

---

### ⭐ Day 7 Summary

A productive day focused on building a scalable ingestion pipeline and strengthening both **Data Engineering** and **SQL** skills. The project is gradually evolving into a production-style data pipeline following modern data engineering best practices.
