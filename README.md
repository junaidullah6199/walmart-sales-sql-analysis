# Walmart Sales SQL Analysis

## Project Overview

This project explores Walmart sales transaction data using MySQL.
The goal is to analyze product performance, sales trends, and customer behavior to uncover actionable business insights.

The dataset contains **1,000 transactions** across three branches located in:

* Mandalay
* Yangon
* Naypyitaw

The analysis focuses on:

* Product performance
* Revenue and profit trends
* Customer segmentation
* Branch performance
* VAT and tax impact

---

#  Tech Stack

* MySQL
* SQL (Data Cleaning + Feature Engineering + Analysis)
* GitHub (Version Control)

---

#   Step 1: Data Cleaning & Loading

* Created database `walmartsales`
* Created structured `sales` table
* Parsed date and time formats
* Removed whitespace using `TRIM`
* Cast numeric columns properly
* Verified no NULL values
* Confirmed 1000 rows inserted successfully

---

#   Step 2: Feature Engineering

Created new analytical columns:

* `time_of_day` → Morning / Afternoon / Evening
* `day_name` → Monday to Sunday
* `month_name` → January / February / March

These columns allow deeper business analysis.

---

#   Step 3: Exploratory Data Analysis (EDA)

---

##   Generic Insights

### Unique Cities

3 cities exist in the dataset.

### Branch Locations

Each branch operates in a unique city.

---

##   Product Analysis

### Unique Product Lines

6 product categories are present.

### Most Selling Product Line (By Quantity)

Food and Beverages recorded the highest quantity sold.

### Product Line With Highest Revenue

Food and Beverages generated the highest revenue overall.

### Product Line With Highest VAT

Food and Beverages also produced the highest VAT.

### Good vs Bad Product Lines

Product lines performing above overall average quantity were marked as "Good".

### Average Rating by Product Line

Some product lines received significantly higher customer ratings, showing stronger satisfaction levels.

---

##   Revenue & Sales Analysis

### Revenue by Month

March generated the highest revenue.

### Month With Largest COGS

March recorded the highest cost of goods sold.

### Revenue by Branch

Branch C produced the highest revenue.

### City With Highest Revenue

Naypyitaw led total revenue.

### Sales by Time of Day

Afternoon showed the highest number of transactions.

---

##   Customer Analysis

### Unique Customer Types

Two customer segments:

* Member
* Normal

### Customer Type Bringing Most Revenue

Members contributed slightly higher total revenue.

### Customer Type Buying Most Quantity

Members purchased more units overall.

### Gender Distribution

Gender distribution was nearly balanced.

### Highest Ratings by Time of Day

Evening transactions showed slightly higher average ratings.

### Best Rated Day

Certain weekdays recorded stronger average ratings compared to others.

---

##   VAT & Tax Insights

### City With Highest VAT

Naypyitaw recorded the highest total VAT.

### Customer Type Paying Most VAT

Members contributed the highest VAT overall.

---

#   Business Insights Summary

1. Food & Beverages is the strongest performing product category.
2. March is peak revenue month.
3. Branch C and Naypyitaw dominate overall sales.
4. Members are more valuable customers (higher revenue + VAT).
5. Afternoon is the busiest sales period.
6. Customer satisfaction is generally high across product lines.

---

#   Project Structure

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

#   How To Run This Project

1. Create database `walmartsales`
2. Run `01_create_load.sql`
3. Run `02_feature_engineering.sql`
4. Run `03_analysis.sql`
5. Screenshot results
6. Upload screenshots inside `/screenshots` folder

---

#   Conclusion

This project demonstrates:

* SQL data cleaning
* Feature engineering
* Business intelligence analysis
* Aggregation, grouping, subqueries
* Revenue and customer segmentation analysis

It reflects practical real-world business analytics using structured SQL.

---

#  Author

Junaid Ullah
MS Business Analytics
SQL | Data Analytics | Business Intelligence
