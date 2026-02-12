sql/01_create_load.sql
/* ============================================================
   01_create_load.sql
   Database creation, table creation, and data loading
   ============================================================ */

-- Use correct database
USE walmartsales;

-- Check database
SELECT DATABASE() AS current_database;

-- Check imported raw table exists
SELECT COUNT(*) AS imported_rows
FROM `walmartsalesdata.csv`;

-- Drop clean table if exists
DROP TABLE IF EXISTS sales;

-- Create clean sales table
CREATE TABLE sales (
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch CHAR(1) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_5_percent DECIMAL(10,4) NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_percentage DECIMAL(11,9),
    gross_income DECIMAL(12,4),
    rating DECIMAL(3,1),

    time_of_day VARCHAR(20),
    day_name VARCHAR(10),
    month_name VARCHAR(10)
);

-- Insert data from imported table into clean table
INSERT INTO sales (
    invoice_id, branch, city, customer_type, gender, product_line,
    unit_price, quantity, tax_5_percent, total, date, time,
    payment, cogs, gross_margin_percentage, gross_income, rating
)
SELECT
    TRIM(`Invoice ID`) AS invoice_id,
    TRIM(`Branch`) AS branch,
    TRIM(`City`) AS city,
    TRIM(`Customer type`) AS customer_type,
    TRIM(`Gender`) AS gender,
    TRIM(`Product line`) AS product_line,
    CAST(`Unit price` AS DECIMAL(10,2)) AS unit_price,
    CAST(`Quantity` AS SIGNED) AS quantity,
    CAST(`Tax 5%` AS DECIMAL(10,4)) AS tax_5_percent,
    CAST(`Total` AS DECIMAL(12,4)) AS total,

    -- Date parsing supports: 2019-01-05 OR 1/5/2019
    CASE
      WHEN `Date` REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
        THEN STR_TO_DATE(`Date`, '%Y-%m-%d')
      WHEN `Date` REGEXP '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
        THEN STR_TO_DATE(`Date`, '%m/%d/%Y')
      ELSE NULL
    END AS date,

    -- Time parsing supports: 13:05:00 OR 13:05
    CASE
      WHEN `Time` REGEXP '^[0-9]{2}:[0-9]{2}:[0-9]{2}$'
        THEN STR_TO_DATE(`Time`, '%H:%i:%s')
      WHEN `Time` REGEXP '^[0-9]{2}:[0-9]{2}$'
        THEN STR_TO_DATE(`Time`, '%H:%i')
      ELSE NULL
    END AS time,

    TRIM(`Payment`) AS payment,
    CAST(`cogs` AS DECIMAL(10,2)) AS cogs,
    CAST(`gross margin percentage` AS DECIMAL(11,9)) AS gross_margin_percentage,
    CAST(`gross income` AS DECIMAL(12,4)) AS gross_income,
    CAST(`Rating` AS DECIMAL(3,1)) AS rating
FROM `walmartsalesdata.csv`;

-- Confirm rows loaded
SELECT COUNT(*) AS sales_rows FROM sales;

-- Show warnings if any
SHOW WARNINGS;
