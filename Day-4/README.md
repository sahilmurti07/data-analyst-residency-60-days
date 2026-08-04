📅 Day 04 – Understanding Enterprise Data Pipelines & Building a Star Schema

Date: 04 August 2026
Duration: 9:30 AM – 6:00 PM
Focus: Microsoft Fabric | Data Pipelines | Warehouse | Star Schema | SQL

🎯 Objective

Today's goal was to understand how enterprise data pipelines handle multiple source tables efficiently and continue building a warehouse using a proper dimensional model for reporting.

💼 Work Completed
1️⃣ Learned Enterprise Data Pipeline Patterns

Explored different approaches for ingesting multiple tables into Microsoft Fabric.

Approach 1 – ForEach Activity

Iterate through multiple source tables
Execute the same Copy Data activity for each table
Useful when migrating many tables from a source system

Approach 2 – Lookup Activity

Store metadata (table names, file paths, etc.) in JSON or key-value format
Use the Lookup activity to retrieve the list
Pass the output into a ForEach loop to automate ingestion

These patterns showed me how production pipelines avoid creating separate copy activities for every table.

2️⃣ Continued SQL Practice

Solved business-oriented SQL problems on StrataScratch to strengthen analytical thinking.

Focused on:

Joins
Aggregations
Window Functions
Business KPI calculations
3️⃣ Continued Warehouse Development

Worked on building a warehouse using a Star Schema.

Created and refined:

Dim_Date
Dim_Customer
Dim_Product
Dim_Region
Fact_Sales

While creating the fact table, I also debugged join and schema issues, which helped me better understand how dimensional modeling works in practice.

4️⃣ Learned About Fact and Dimension Tables

Today's biggest takeaway was understanding the purpose of each table.

Dimension Tables

Store descriptive attributes
Used for filtering and slicing reports

Fact Table

Stores business transactions and measurable values
References dimensions using surrogate keys
🧠 Key Learnings

Today I learned:

How enterprise pipelines ingest multiple tables efficiently using Lookup and ForEach.
Why metadata-driven pipelines are preferred over hardcoding every source.
The difference between Fact and Dimension tables.
How Star Schema improves reporting and dashboard performance.
Why surrogate keys and unique business keys matter when building a warehouse.
How incorrect joins can duplicate rows in a fact table and how to debug those issues.
🛠️ Technologies Used
Microsoft Fabric
Data Pipelines
Warehouse
SQL
PySpark
Delta Lake
StrataScratch
💭 Reflection

Today shifted my perspective from simply building pipelines to understanding how they scale in real enterprise environments. Learning metadata-driven ingestion with Lookup and ForEach made me appreciate how teams automate loading dozens or even hundreds of tables without duplicating pipeline logic.

Building the warehouse also reinforced the importance of proper dimensional modeling. Debugging joins and creating a Star Schema helped me understand that data modeling is just as important as writing SQL or PySpark code.

📈 Progress

✅ Day 04 Completed

Current Focus:

Microsoft Fabric Pipelines
Metadata-driven ETL
Warehouse Design
Star Schema
SQL Problem Solving

Tomorrow's Goal:

Complete the semantic model by connecting the fact and dimension tables, then start building the first Power BI dashboard.
