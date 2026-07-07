/*
=========================================================

Retail Business Intelligence Project

File Name : 03_ADVANCED_Queries.sql

Author : Tanvi Dhanokar

Description:
This file contains advanced business intelligence
queries combining multiple datasets to generate
strategic business insights.

=========================================================
*/

/*
=========================================================
Business Question 9

Question:
Which product categories receive the lowest average
customer review scores?

Business Purpose:
Identify product categories with lower customer
satisfaction so that the company can investigate
quality, seller performance, product descriptions,
or operational issues.

=========================================================
*/

SELECT
    pct.product_category_name_english,

    ROUND(AVG(r.review_score),2) AS avg_review_score

FROM order_reviews r

JOIN order_items oi
ON r.order_id = oi.order_id

JOIN products p
ON oi.product_id = p.product_id

JOIN product_category_name_translation pct
ON p.product_category_name = pct.product_category_name

WHERE r.review_score IS NOT NULL

GROUP BY pct.product_category_name_english

ORDER BY avg_review_score ASC;


/*
=========================================================
Business Question 10

Question:
Which product categories generate the highest revenue,
and how do customers rate them?

Business Purpose:
Compare product category revenue with customer review
scores to identify high-performing categories and
high-revenue categories that may require quality
improvements.

=========================================================
*/

SELECT
    pct.product_category_name_english,

    ROUND(SUM(oi.price),2) AS total_revenue,

    ROUND(AVG(r.review_score),2) AS avg_review_score

FROM order_reviews r

JOIN order_items oi
ON r.order_id = oi.order_id

JOIN products p
ON oi.product_id = p.product_id

JOIN product_category_name_translation pct
ON p.product_category_name = pct.product_category_name

GROUP BY pct.product_category_name_english

ORDER BY total_revenue DESC;