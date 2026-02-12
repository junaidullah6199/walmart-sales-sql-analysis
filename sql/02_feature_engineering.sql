sql/02_feature_engineering.sql
  
/* ============================================================
   02_feature_engineering.sql
   WALMART SALES SQL ANALYSIS (MySQL)

   Purpose:
   - Create derived columns for analysis:
     1) time_of_day  (Morning / Afternoon / Evening)
     2) day_name     (Monday...Sunday)
     3) month_name   (January...December)

   Assumes:
   - Database: walmartsales
   - Table: sales
   ============================================================ */

USE walmartsales;

-- ============================================================
-- 1) ADD NEW COLUMNS (only if missing)
-- ============================================================
ALTER TABLE sales
  ADD COLUMN IF NOT EXISTS time_of_day VARCHAR(20),
  ADD COLUMN IF NOT EXISTS day_name VARCHAR(10),
  ADD COLUMN IF NOT EXISTS month_name VARCHAR(10);

-- ============================================================
-- 2) POPULATE NEW COLUMNS
-- ============================================================
UPDATE sales
SET
  time_of_day = CASE
      WHEN time < '12:00:00' THEN 'Morning'
      WHEN time < '17:00:00' THEN 'Afternoon'
      ELSE 'Evening'
  END,
  day_name = DAYNAME(date),
  month_name = MONTHNAME(date);

-- ============================================================
-- 3) QUALITY CHECKS (TAKE SCREENSHOTS OF THESE)
-- ============================================================

-- Title: Engineered columns null check (should all be 0)
SELECT
  SUM(time_of_day IS NULL) AS null_time_of_day,
  SUM(day_name IS NULL) AS null_day_name,
  SUM(month_name IS NULL) AS null_month_name
FROM sales;

-- Title: Distinct engineered values (quick validation)
SELECT
  month_name,
  day_name,
  time_of_day,
  COUNT(*) AS rows_count
FROM sales
GROUP BY month_name, day_name, time_of_day
ORDER BY
  FIELD(month_name,'January','February','March','April','May','June','July','August','September','October','November','December'),
  FIELD(day_name,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
  FIELD(time_of_day,'Morning','Afternoon','Evening');

-- Title: Sample rows including new columns
SELECT
  invoice_id, date, time, time_of_day, day_name, month_name
FROM sales
LIMIT 20;

