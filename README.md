
# Retail Sales Analysis Using SQL

## Overview
This project uses SQLite to analyze the Sample Superstore
dataset and explore retail sales and profitability.

## Dataset
The dataset contains fictional retail transactions and is
used for analytics practice.

Source:
https://github.com/leonism/sample-superstore/blob/master/data/superstore.csv

## Business Questions
1. Which regions generate the most sales and profit?
2. Which product categories generate the most sales and profit?
3. Which subcategories have the lowest total profit?
4. How do sales and profit compare across discount groups?

## Tools and Skills
- SQL and SQLite
- Data cleaning and type conversion
- SUM() and COUNT()
- GROUP BY and ORDER BY
- CASE WHEN
- Business data analysis

## Key Findings
- Technology had the highest sales and profit among
  the three product categories in the results.
- Furniture had substantial sales but comparatively
  low total profit.
- Tables had the largest negative total profit among
  the subcategories shown in the initial analysis.
- The West region had the highest sales and profit
  among the four named regions.

## Limitations
The data is fictional, not actual company data.
The results are descriptive and do not establish
that discounts caused changes in profitability.

## Files
- retail_sales_analysis.sql: SQL cleaning and analysis queries.

## How to Run
1. Download the CSV from the source link.
2. Import it into SQLite as a table named superstore.
3. Ensure the imported columns match c1 through c21,
   with the CSV header stored as the first row.
4. Run retail_sales_analysis.sql.
5. Review the query results.

