-- What are the monthly and quarterly sales trends for Macbooks sold in North America across all years?
SELECT DATE_TRUNC(purchase_ts, quarter) AS purchase_quarter
      ,COUNT(orders.id) AS order_count
      ,ROUND(SUM(usd_price),2) AS total_sales
      ,ROUND(AVG(usd_price),2) AS AOV
FROM elist.orders
INNER JOIN elist.customers
      ON orders.customer_id = customers.id
LEFT JOIN elist.geo_lookup
      ON customers.country_code = geo_lookup.country
WHERE region = 'NA'
     AND LOWER(product_name) LIKE '%macbook%'
GROUP BY 1
ORDER BY 3;
SELECT DISTINCT product_name FROM `elist.orders`;

-- What was the monthly refund rate for purchases made in 2020? How many refunds did we have each month in 2021 for Apple products? 
SELECT DATE_TRUNC(orders.purchase_ts, month) AS purchase_month
      ,COUNT(orders.id) AS order_count
      ,SUM(
            CASE WHEN order_status.refund_ts IS NOT NULL THEN 1
            ELSE 0
       END) refunds
      ,ROUND(SUM(
            CASE WHEN order_status.refund_ts IS NOT NULL THEN 1
            ELSE 0
       END)/COUNT(orders.id)*100, 2) AS refund_rate
FROM elist.orders
LEFT JOIN elist.order_status
   ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 1;
-- Variation 2: Using a CTE
WITH orders_refund_counts AS (
      SELECT DATE_TRUNC(orders.purchase_ts, month) AS purchase_month
      ,COUNT(orders.id) AS order_count
      ,SUM(
            CASE WHEN order_status.refund_ts IS NOT NULL THEN 1
            ELSE 0
       END) refunds
FROM elist.orders
LEFT JOIN elist.order_status
   ON orders.id = order_status.order_id
WHERE orders.purchase_ts BETWEEN '2021-01-01' AND '2021-12-31'
AND LOWER(orders.product_name) LIKE '%apple%'
GROUP BY 1
ORDER BY 1)
      
SELECT purchase_month
      ,ROUND(refunds/order_count*100, 2) AS refund_rate
 FROM orders_refund_counts;

-- Are there certain products that are getting refunded more frequently than others? Top 3 most refunded products across all years
SELECT CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4k gaming monitor' ELSE product_name END AS product _clean
      ,SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) as refunds
      ,SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END)/COUNT(DISTINCT orders.id) AS refund_rate
FROM elist.orders orders
LEFT JOIN elist.orders_status elist.order_status
    ON orders.id = orders_status.order_id
GROUP BY 1
ORDER BY 3 DESC;

-- Order in descending order of refund count to get the top 3 highest refund count
SELECT CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END AS product_clean
      ,SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refunds
      ,SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END)/COUNT(DISTINCT orders.id) AS refund_rate
FROM elist.orders orders
LEFT JOIN elist.order_status order_status
    ON orders.id = order_status.order_id
GROUP By 1
ORDER BY 2 DESC
LIMIT BY 3;

-- Question 4: What’s the average order value across different account creation methods in the first two months of 2022? Which method had the most new customers in this time?
-- Average Order Value (AOV) = Total Revenue / Numbers of orders placed
SELECT customers.account_creation_platform AS account_creation_method
      ,AVG(usd_price) as AOV
      ,COUNT(DISTINCT customers.id) AS customer_count
FROM elist.orders orders
LEFT JOIN elist.customers customers
  ON orders.customer_id = customers.id
WHERE created_on BETWEEN '2022-01-01' AND '2022-02-28'
GROUP BY 1
ORDER BY 3 DESC;

-- What’s the average time between customer registration and placing an order?
WITH days_to_purchase_cte AS (
SELECT customers.id AS customer_id
      ,orders.id AS orders_id
      ,customers.created_on AS created_on
      ,orders.purchase_ts AS purchase_ts
      ,DATE_DIFF(orders.purchase_ts, customers.created_on, day) AS days_to_purchase
FROM elist.customers customers
LEFT JOIN elist.orders orders
  ON customers.id = orders.customer_id
ORDER BY 1, 2, 3)
      
SELECT AVG(days_to_purchase) AS avg_days_to_purchase
FROM days_to_purchase_cte;

/* Which marketing channels perform the best in each region? Does the top channel differ across regions?
"Best": Highest number of sales? Highest AOV? Highest total sales?
Calculate the total number of orders and total sales by region and registration channel
Rank the channels by total sales, and order the dataset by this ranking to surface the top channels per region first */

WITH region_orders as (
  SELECT geo_lookup.region AS region
        ,customers.marketing_channel AS marketing_channel
        ,COUNT(DISTINCT orders.id) AS num_orders
        ,SUM(orders.usd_price) AS total_sales
        ,AVG(orders.usd_price) AS aov
FROM elist.orders orders
LEFT JOIN elist.customers customers
  ON orders.customer_id = customers.id
LEFT JOIN elist.geo_lookup geo_lookup
  ON customers.country_code = geo_lookup.country
GROUP BY 1, 2
ORDER BY 1, 2)

SELECT *
      ,ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_sales DESC) as ranking
FROM region_orders
ORDER BY 6;


