/*
=========================================================

Retail Business Intelligence Project

File Name : 02_INTERMEDIATE_Queries.sql

Author : Tanvi Dhanokar

Description:
This file contains intermediate SQL queries involving
table joins and business KPI analysis.

=========================================================
*/

/*
=========================================================
Business Question 4

Question:
Who are the customers with the highest number of orders?

Business Purpose:
Identify the company's most active customers to support
loyalty programs and personalized marketing.

=========================================================
*/

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id

ORDER BY total_orders DESC

LIMIT 10;

/*
=========================================================
Business Question 5

Question:
Which product categories generate the highest revenue?

Business Purpose:
Identify the most profitable product categories to support
inventory planning and marketing decisions.

=========================================================
*/

SELECT
    pct.product_category_name_english,
    ROUND(SUM(oi.price),2) AS total_revenue

FROM order_items oi

JOIN products p
ON oi.product_id = p.product_id

JOIN product_category_name_translation pct
ON p.product_category_name = pct.product_category_name

GROUP BY pct.product_category_name_english

ORDER BY total_revenue DESC

LIMIT 10;


/*
=========================================================
Business Question 6

Question:
How does revenue change month by month?

Business Purpose:
Analyze monthly sales trends to identify growth,
seasonality, and business performance.

=========================================================
*/

SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,
    ROUND(SUM(oi.price),2) AS total_revenue

FROM order_items oi

JOIN orders o
ON oi.order_id = o.order_id

WHERE strftime('%Y', o.order_purchase_timestamp) = '2017'

GROUP BY month

ORDER BY month;


/*
=========================================================
Business Question 8

Question:
Does delivery time affect customer review scores?

Business Purpose:
Analyze whether delivery time has an impact on
customer satisfaction by comparing average delivery
time across different review scores.

=========================================================
*/

SELECT
    r.review_score,

    ROUND(
        AVG(
            julianday(o.order_delivered_customer_date) -
            julianday(o.order_purchase_timestamp)
        ),
    2) AS avg_delivery_days

FROM orders o

JOIN order_reviews r
ON o.order_id = r.order_id

WHERE o.order_delivered_customer_date IS NOT NULL

GROUP BY r.review_score

ORDER BY r.review_score DESC;