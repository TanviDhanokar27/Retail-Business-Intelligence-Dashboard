/*
=========================================================

Retail Business Intelligence Project

File Name : 01_BASIC_Queries.sql

Author : Tanvi Dhanokar

Description:
This file contains foundational SQL queries used to
understand the business, customer base, and overall
logistics performance.

=========================================================
*/



/*
=========================================================
Business Question 1

Question:
How many total orders has the company received?

Business Purpose:
Measure the overall transaction volume handled by the company.

=========================================================
*/

SELECT COUNT(*) AS total_orders
FROM orders;


/*
=========================================================
Business Question 2

Question:
How many unique customers does the company have?

Business Purpose:
Measure the total customer base and market reach.

=========================================================
*/

SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;

/*
=========================================================
Business Question 3

Question:
Which states have the highest number of customers?

Business Purpose:
Identify regions with the largest customer base to support
marketing, logistics, and expansion decisions.

=========================================================
*/

SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS total_customers

FROM customers

GROUP BY customer_state

ORDER BY total_customers DESC;

/*
=========================================================
Business Question 7

Question:
What is the average delivery time (in days)?

Business Purpose:
Evaluate logistics performance and customer experience.

=========================================================
*/

SELECT

ROUND(
    AVG(
        julianday(order_delivered_customer_date) -
        julianday(order_purchase_timestamp)
    ),
2) AS avg_delivery_days

FROM orders

WHERE order_delivered_customer_date IS NOT NULL;























