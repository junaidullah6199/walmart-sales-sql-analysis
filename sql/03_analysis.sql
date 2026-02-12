sql/03_analysis.sql

 /* ============================================================
   03_analysis.sql
   WALMART SALES SQL ANALYSIS (MySQL)

   Purpose:
   - Answer business questions (Generic, Product, Sales, Customer)
   - Each query has a TITLE comment so you can screenshot easily

   Assumes:
   - Database: walmartsales
   - Table: sales (1000 rows)
   - Engineered columns exist + filled:
       time_of_day, day_name, month_name
   ============================================================ */

USE walmartsales;

-- ============================================================
-- 0) QUICK CHECKS (Screenshot these first)
-- ============================================================

-- Title: Current database
SELECT DATABASE() AS current_db;

-- Title: Row count (should be 1000)
SELECT COUNT(*) AS sales_rows FROM sales;

-- Title: Null check for engineered columns (should be 0)
SELECT
  SUM(date IS NULL) AS null_date,
  SUM(time IS NULL) AS null_time,
  SUM(time_of_day IS NULL) AS null_time_of_day,
  SUM(day_name IS NULL) AS null_day_name,
  SUM(month_name IS NULL) AS null_month_name
FROM sales;

-- Title: Sample rows
SELECT * FROM sales LIMIT 10;

-- ============================================================
-- 1) GENERIC QUESTIONS
-- ============================================================

-- Title: Unique cities
SELECT COUNT(DISTINCT city) AS unique_cities
FROM sales;

-- Title: City of each branch
SELECT DISTINCT branch, city
FROM sales
ORDER BY branch;

-- ============================================================
-- 2) PRODUCT QUESTIONS
-- ============================================================

-- Title: Unique product lines
SELECT COUNT(DISTINCT product_line) AS unique_product_lines
FROM sales;

-- Title: Most common payment method
SELECT payment, COUNT(*) AS cnt
FROM sales
GROUP BY payment
ORDER BY cnt DESC;

-- Title: Most selling product line (quantity)
SELECT product_line, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_line
ORDER BY total_quantity DESC;

-- Title: Revenue by month (correct order)
SELECT
  month_name,
  ROUND(SUM(total), 2) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY FIELD(month_name,'January','February','March','April','May','June','July','August','September','October','November','December');

-- Title: Month with largest COGS
SELECT
  month_name,
  ROUND(SUM(cogs), 2) AS total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC;

-- Title: Product line with highest revenue
SELECT
  product_line,
  ROUND(SUM(total), 2) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- Title: City with largest revenue
SELECT
  city,
  ROUND(SUM(total), 2) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;

-- Title: Product line with highest VAT (Tax 5%)
SELECT
  product_line,
  ROUND(SUM(tax_5_percent), 2) AS total_vat
FROM sales
GROUP BY product_line
ORDER BY total_vat DESC;

-- Title: Good / Bad product line (Good if above overall avg quantity)
SELECT
  product_line,
  CASE
    WHEN AVG(quantity) > (SELECT AVG(quantity) FROM sales) THEN 'Good'
    ELSE 'Bad'
  END AS remark
FROM sales
GROUP BY product_line
ORDER BY product_line;

-- Title: Branch selling more than average branch
SELECT branch, SUM(quantity) AS branch_qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) >
(
  SELECT AVG(branch_total)
  FROM (
    SELECT SUM(quantity) AS branch_total
    FROM sales
    GROUP BY branch
  ) x
);

-- Title: Average rating by product line
SELECT
  product_line,
  ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- ============================================================
-- 3) SALES / REVENUE QUESTIONS
-- ============================================================

-- Title: Revenue by branch
SELECT
  branch,
  ROUND(SUM(total), 2) AS total_revenue
FROM sales
GROUP BY branch
ORDER BY total_revenue DESC;

-- Title: Average transaction value by city
SELECT
  city,
  ROUND(AVG(total), 2) AS avg_transaction_value
FROM sales
GROUP BY city
ORDER BY avg_transaction_value DESC;

-- Title: Number of sales by day and time_of_day
SELECT
  day_name,
  time_of_day,
  COUNT(*) AS total_sales
FROM sales
GROUP BY day_name, time_of_day
ORDER BY FIELD(day_name,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
         FIELD(time_of_day,'Morning','Afternoon','Evening');

-- Title: Customer type bringing most revenue
SELECT
  customer_type,
  ROUND(SUM(total), 2) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- Title: City with largest VAT amount
SELECT
  city,
  ROUND(SUM(tax_5_percent), 2) AS total_vat
FROM sales
GROUP BY city
ORDER BY total_vat DESC;

-- Title: Customer type paying most VAT
SELECT
  customer_type,
  ROUND(SUM(tax_5_percent), 2) AS total_vat
FROM sales
GROUP BY customer_type
ORDER BY total_vat DESC;

-- ============================================================
-- 4) CUSTOMER QUESTIONS
-- ============================================================

-- Title: Unique customer types
SELECT COUNT(DISTINCT customer_type) AS unique_customer_types
FROM sales;

-- Title: Unique payment methods
SELECT COUNT(DISTINCT payment) AS unique_payment_methods
FROM sales;

-- Title: Most common customer type
SELECT
  customer_type,
  COUNT(*) AS total_count
FROM sales
GROUP BY customer_type
ORDER BY total_count DESC;

-- Title: Customer type buying most quantity
SELECT
  customer_type,
  SUM(quantity) AS total_quantity
FROM sales
GROUP BY customer_type
ORDER BY total_quantity DESC;

-- Title: Gender distribution overall
SELECT
  gender,
  COUNT(*) AS gender_count
FROM sales
GROUP BY gender
ORDER BY gender_count DESC;

-- Title: Gender distribution per branch
SELECT
  branch,
  gender,
  COUNT(*) AS gender_count
FROM sales
GROUP BY branch, gender
ORDER BY branch, gender_count DESC;

-- Title: Highest average rating by time_of_day
SELECT
  time_of_day,
  ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Title: Best average rating by day of week
SELECT
  day_name,
  ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC;

-- Title: Best average rating per branch by day
SELECT
  branch,
  day_name,
  ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY branch, day_name
ORDER BY branch, avg_rating DESC;

/* ============================ END ============================ */
