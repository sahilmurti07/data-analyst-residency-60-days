# Day 05 — Building the Semantic Model

📅 **Date:** 05 August 2026

## 🎯 Objective

Complete the analytics layer by building a Semantic Model on top of the Star Schema and continue improving SQL problem-solving skills.

---

## 🚀 What I Worked On Today

### 🏗 Microsoft Fabric - Semantic Model

Today I completed one of the most important stages of the analytics workflow by creating a **Semantic Model** in Microsoft Fabric.

### Completed Tasks

- Connected the Warehouse with the Semantic Model.
- Added all Dimension and Fact tables.
- Created and verified relationships between tables.
- Implemented a proper **Star Schema** consisting of:
  - Fact_Sales
  - Dim_Date
  - Dim_Customer
  - Dim_Product
  - Dim_Region
- Verified one-to-many relationships for each dimension.

---

### 📊 Report Creation

After completing the Semantic Model, I created my first report using the modeled data.

Although it is not a complete dashboard yet, it validated that the data model is working correctly and is ready for future dashboard development.

---

### 💻 SQL Practice

Continued solving business-oriented SQL interview questions on **StrataScratch**.

Today's focus included:

- Common Table Expressions (CTEs)
- Aggregate Functions
- JOIN Operations
- Business Compensation Calculations
- Business Logic Implementation

---

## 🧠 Key Learnings

Today's work helped me understand how different components of Microsoft Fabric connect together.

```text
Raw Data
      │
      ▼
Bronze Layer
      │
      ▼
Silver Layer
      │
      ▼
Gold Layer
      │
      ▼
Warehouse
      │
      ▼
Star Schema
      │
      ▼
Semantic Model
      │
      ▼
Reports & Dashboards
```

The Semantic Model acts as the business layer that connects the warehouse with reporting tools, making data easier to analyze while maintaining consistent relationships and calculations.

---

## 🛠 Technologies Used

- Microsoft Fabric
- OneLake
- Warehouse
- Semantic Model
- Star Schema
- SQL
- StrataScratch

---

## 📌 Challenges

- Understanding how Warehouse tables integrate with the Semantic Model.
- Configuring and validating relationships between Fact and Dimension tables.
- Ensuring the data model was optimized for reporting.

---

## ✅ Outcome

- Semantic Model successfully created.
- Star Schema successfully connected.
- First report successfully generated.
- Continued improving SQL interview problem-solving skills.

---

## 📈 Progress

- [x] Data Pipeline
- [x] Bronze Layer
- [x] Silver Layer
- [x] Gold Layer
- [x] Warehouse
- [x] Star Schema
- [x] Semantic Model
- [x] Initial Report
- [ ] Interactive Dashboard
- [ ] Power BI Service Deployment

---

## 💭 Reflection

Today marked an important milestone in my learning journey. Building the Semantic Model helped me understand how raw data evolves into business-ready insights. Connecting the Star Schema to reporting gave me a clearer picture of how analytics solutions are designed in enterprise environments. Alongside this, solving SQL business problems continues to strengthen my analytical thinking and problem-solving approach.
