#  Walmart Sales SQL Analysis

##  Project Overview

This project analyzes Walmart transactional sales data using MySQL to uncover insights related to product performance, revenue trends, branch efficiency, and customer behavior.

The dataset contains **1,000 transactions** across three branches:

* Mandalay
* Yangon
* Naypyitaw

The objective is to apply SQL for real-world business analysis, transforming raw transactional data into actionable insights.

---

#  Tech Stack

* MySQL
* SQL (Data Cleaning, Feature Engineering, Exploratory Analysis)
* Git & GitHub

---

#  Data Preparation

### Database & Table Setup

* Created database: `walmartsales`
* Designed structured `sales` table with appropriate data types
* Imported and validated 1,000 rows

### Data Cleaning

* Trimmed whitespace using `TRIM`
* Cast numeric columns to proper decimal types
* Parsed mixed date/time formats using `STR_TO_DATE`
* Verified no NULL values in critical fields

---

#  Feature Engineering

Added analytical fields to enable deeper insights:

* `time_of_day` → Morning / Afternoon / Evening
* `day_name` → Extracted weekday from transaction date
* `month_name` → Extracted month from transaction date

These engineered fields allow temporal sales pattern analysis.

---

#  Exploratory Data Analysis (EDA)

##  Branch & Location Insights

* 3 unique cities in dataset
* Each branch operates in a distinct city
* Naypyitaw generates the highest total revenue
* Branch C is the top-performing branch

---

##  Product Performance

* 6 unique product lines
* **Food & Beverages** is the highest-selling category (by quantity)
* Food & Beverages also generates the highest revenue and VAT
* Several product lines outperform overall average sales (classified as "Good")
* Ratings are consistently strong across categories

---

##  Revenue Trends

* March is the highest revenue month
* March also has the highest COGS
* Afternoon is the busiest sales period
* Revenue distribution varies slightly across branches

---

##  Customer Insights

* 2 customer types: Member and Normal
* Members generate slightly higher total revenue
* Members purchase higher quantities overall
* Gender distribution is nearly balanced
* Evening transactions show marginally higher average ratings

---

##  VAT & Tax Insights

* Naypyitaw records the highest VAT contribution
* Members contribute the highest VAT amount

---

#  Business Insights Summary

1. Food & Beverages drives overall profitability.
2. March represents peak operational performance.
3. Branch C and Naypyitaw lead in revenue contribution.
4. Members are higher-value customers.
5. Afternoon is the strongest sales window.
6. Customer satisfaction remains consistently strong.

---

#  Project Structure

```
walmart-sales-sql-analysis/
│
├── sql/
│   ├── 01_create_load.sql
│   ├── 02_feature_engineering.sql
│   └── 03_analysis.sql
│
├── screenshots/
│
└── README.md
```

---

#  How to Run

1. Create database `walmartsales`
2. Execute `01_create_load.sql`
3. Execute `02_feature_engineering.sql`
4. Execute `03_analysis.sql`

---

#  Key Skills Demonstrated

* Relational database design
* Data cleaning and transformation
* Feature engineering
* Aggregation and grouping
* Subqueries and conditional logic
* Business performance analysis

---

#  Author

**Junaid Ullah**
MS Business Analytics
SQL | Data Analytics | Business Intelligence


