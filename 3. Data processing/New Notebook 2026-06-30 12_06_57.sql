-- Databricks notebook source
--reviewing data sets 
SELECT *
FROM bright_coffee_shop.shop.sales;

--finding unique store_location 
SELECT DISTINCT store_location
FROM bright_coffee_shop.shop.sales;

--Describing the data types and checking for NULLS in each column
DESCRIBE TABLE bright_coffee_shop.shop.sales;

--COUNTING THE NUMBER OF ROWS IN THE TABLE
SELECT COUNT(*) AS total_rows
FROM bright_coffee_shop.shop.sales;


SELECT COUNT(transaction_id) AS transaction_count
FROM bright_coffee_shop.shop.sales;


SELECT COUNT(transaction_id) AS transaction_count
FROM bright_coffee_shop.shop.sales;

--for replacing missing data
SELECT
   transaction_id,
   COALESCE(product_category, 'Unknown') AS product_category_filled,
   COALESCE(product_type, 'Unknown') AS product_type_filled,
   COALESCE(product_detail, 'Unknown') AS product_detail_filled
FROM bright_coffee_shop.shop.sales;   


--find orders with missing product category data
SELECT *
FROM bright_coffee_shop.shop.sales
WHERE product_category IS NULL;

--Only keep rows with valid transaction_date
SELECT *
FROM bright_coffee_shop.shop.sales
WHERE transaction_date IS NOT NULL;

----finding rows containing NULL 
SELECT *
FROM bright_coffee_shop.shop.sales 
WHERE transaction_id IS NULL
      OR transaction_date IS NULL
      OR transaction_time IS NULL
      OR store_location IS NULL
      OR transaction_qty IS NULL
      OR store_id IS NULL
      OR product_id IS NULL
      OR unit_price IS NULL
      OR product_category IS NULL
      OR product_type IS NULL
      OR product_detail IS NULL;






---data range of data sets 
SELECT MIN(transaction_date) AS earliest_date,
       MAX(transaction_date) AS latest_date
FROM bright_coffee_shop.shop.sales;

---remove time stamp_date
SELECT transaction_time,
      DATE_FORMAT(transaction_time,'hh-mm-ss') AS clean_time
FROM bright_coffee_shop.shop.sales;   

---Product levels
SELECT DISTINCT product_category,
                product_type
FROM bright_coffee_shop.shop.sales;  

SELECT DISTINCT product_type
FROM bright_coffee_shop.shop.sales; 

SELECT DISTINCT product_detail
FROM bright_coffee_shop.shop.sales; 

---findng the total number of transactions
SELECT COUNT(DISTINCT transaction_id) AS total_transactions
FROM bright_coffee_shop.shop.sales;  
 
---transactions per day
SELECT transaction_date,
       COUNT(DISTINCT transaction_id) AS total_transactions
FROM bright_coffee_shop.shop.sales
GROUP BY transaction_date;

---transactions per month
SELECT MONTHNAME(transaction_date) AS month,
       COUNT(DISTINCT transaction_id) AS total_transactions
FROM bright_coffee_shop.shop.sales
GROUP BY transaction_date;

---revenue per month
SELECT MONTHNAME(transaction_date) AS month,
       SUM(unit_price*transaction_qty) AS total_revenue
FROM bright_coffee_shop.shop.sales
GROUP BY MONTHNAME(transaction_date);

SELECT unit_price * transaction_qty AS revenue
FROM bright_coffee_shop.shop.sales;

SELECT 
  CAST(REPLACE(unit_price, ',', '') AS BIGINT) * transaction_qty AS revenue
FROM bright_coffee_shop.shop.sales;

SELECT unit_price,
       transaction_qty,
       CAST(transaction_qty AS DOUBLE) * CAST(REPLACE(unit_price, ',', '') AS DOUBLE) AS revenue
FROM bright_coffee_shop.shop.sales; 

SELECT MONTHNAME(transaction_date) AS month,
       SUM(CAST(transaction_qty AS DOUBLE) * CAST(REPLACE(unit_price, ',', '') AS DOUBLE)) AS revenue
FROM bright_coffee_shop.shop.sales
GROUP BY MONTHNAME(transaction_date);


