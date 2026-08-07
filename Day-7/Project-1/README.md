# Day 7 – Dynamic Data Ingestion Pipeline with Microsoft Fabric

## 📌 Overview
Today I started a new end-to-end Data Engineering project in **Microsoft Fabric**. The focus was on building a dynamic ingestion pipeline capable of loading multiple datasets from an API into a Lakehouse while following the **Medallion Architecture**.

---

## 🚀 What I Built

### 1. Dynamic Data Ingestion
- Created a **Microsoft Fabric Data Pipeline**.
- Used a **ForEach Loop** to iterate through multiple API endpoints/files.
- Ingested all datasets dynamically instead of creating separate Copy Data activities.
- Loaded the raw data into the **Bronze Layer** as Delta tables.

### 2. Bronze Layer
- Successfully stored multiple datasets in the Lakehouse.
- Verified row counts and schema after ingestion.
- Used Delta format for efficient storage and processing.

### 3. Bronze → Silver Notebook
- Started the transformation notebook using **PySpark**.
- Loaded Bronze Delta tables.
- Performed initial data exploration.
- Began cleaning and preparing data for the Silver layer.

### 4. SQL Practice
- Solved multiple **StrataScratch SQL** interview questions.
- Practiced:
  - Window Functions
  - CASE WHEN
  - Conditional Aggregation
  - Ranking Functions
  - Business Logic

---

## 🛠️ Tech Stack
- Microsoft Fabric
- Data Pipeline
- ForEach Activity
- Lakehouse
- Delta Tables
- PySpark
- SQL
- StrataScratch

---

## 📚 Key Learnings
- Building dynamic ingestion pipelines using **ForEach**.
- Automating ingestion of multiple datasets.
- Working with Delta tables inside Lakehouse.
- Reading and transforming data using PySpark.
- Strengthening SQL problem-solving with business-focused interview questions.

---

## 📅 Progress
- ✅ Dynamic Pipeline
- ✅ Bronze Layer
- 🔄 Silver Layer (In Progress)
- ⏳ Gold Layer
- ⏳ Power BI Dashboard
