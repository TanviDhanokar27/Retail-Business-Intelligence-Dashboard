# Data Dictionary

## Customers

| Column | Description |
|----------|-------------|
| customer_id | Unique customer identifier |
| customer_unique_id | Unique customer reference |
| customer_city | Customer city |
| customer_state | Customer state |

---

## Orders

| Column | Description |
|----------|-------------|
| order_id | Unique order identifier |
| customer_id | Customer placing the order |
| order_purchase_timestamp | Order purchase date |
| order_delivered_customer_date | Delivery date |

---

## Order Items

| Column | Description |
|----------|-------------|
| order_id | Order identifier |
| product_id | Purchased product |
| seller_id | Seller identifier |
| price | Product price |
| freight_value | Shipping cost |

---

## Payments

| Column | Description |
|----------|-------------|
| payment_type | Payment method |
| payment_value | Payment amount |

---

## Reviews

| Column | Description |
|----------|-------------|
| review_score | Customer rating (1–5) |

---

## Products

| Column | Description |
|----------|-------------|
| product_id | Product identifier |
| product_category_name | Product category |