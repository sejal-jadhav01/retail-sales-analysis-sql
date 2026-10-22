
-- Retail Sales Analysis Using SQL
-- Dataset: Sample Superstore (fictional retail data)
-- Source: https://github.com/leonism/sample-superstore/blob/master/data/superstore.csv
-- Tool: SQLite

-- Rebuild the cleaned table each time the script runs.
DROP TABLE IF EXISTS superstore_clean;

CREATE TABLE superstore_clean AS
SELECT
    c1 AS row_id,
    c2 AS order_id,
    c3 AS order_date,
    c4 AS ship_date,
    c5 AS ship_mode,
    c6 AS customer_id,
    c7 AS customer_name,
    c8 AS segment,
    c9 AS country,
    c10 AS city,
    c11 AS state,
    c12 AS postal_code,
    c13 AS region,
    c14 AS product_id,
    c15 AS category,
    c16 AS sub_category,
    c17 AS product_name,
    CAST(c18 AS REAL) AS sales,
    CAST(c19 AS INTEGER) AS quantity,
    CAST(c20 AS REAL) AS discount,
    CAST(c21 AS REAL) AS profit
FROM superstore
WHERE TRIM(c1) <> 'Row ID'
  AND TRIM(COALESCE(c13, '')) <> '';

-- 1. Count cleaned records.
SELECT COUNT(*) AS total_records
FROM superstore_clean;

-- 2. Sales and profit by region.
SELECT region,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore_clean
GROUP BY region
ORDER BY total_sales DESC;

-- 3. Sales and profit by category.
SELECT category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore_clean
WHERE TRIM(COALESCE(category, '')) <> ''
GROUP BY category
ORDER BY total_sales DESC;

-- 4. Subcategories ranked by profit, lowest first.
SELECT sub_category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore_clean
WHERE TRIM(COALESCE(sub_category, '')) <> ''
GROUP BY sub_category
ORDER BY total_profit ASC;

-- 5. Compare sales and profit by discount group.
SELECT
    CASE
        WHEN discount = 0 THEN 'No discount'
        WHEN discount <= 0.10 THEN 'Low discount (up to 10%)'
        ELSE 'High discount (over 10%)'
    END AS discount_group,
    COUNT(*) AS record_count,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_clean
GROUP BY discount_group
ORDER BY total_profit DESC;
