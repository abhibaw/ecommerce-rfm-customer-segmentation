-- 1. Revenue by Country
SELECT
    "Country",
    ROUND(SUM("TotalPrice")::numeric, 2) AS total_revenue,
    COUNT(DISTINCT "Invoice") AS num_orders
FROM transactions
GROUP BY "Country"
ORDER BY total_revenue DESC
LIMIT 10;


-- 2. Revenue by Month
SELECT
    DATE_TRUNC('month', "InvoiceDate") AS month,
    ROUND(SUM("TotalPrice")::numeric, 2) AS total_revenue,
    COUNT(DISTINCT "Invoice") AS num_orders
FROM transactions
GROUP BY month
ORDER BY month;


-- 3. Repeat vs One-Time Customers
WITH customer_orders AS (
    SELECT
        "Customer ID",
        COUNT(DISTINCT "Invoice") AS order_count
    FROM transactions
    GROUP BY "Customer ID"
)
SELECT
    CASE
        WHEN order_count > 1 THEN 'Repeat Customer'
        ELSE 'One-Time Customer'
    END AS customer_type,
    COUNT(*) AS num_customers,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM customer_orders
GROUP BY customer_type;


-- 4. Top 10 Products by Revenue
SELECT
    "StockCode",
    "Description",
    ROUND(SUM("TotalPrice")::numeric, 2) AS total_revenue,
    SUM("Quantity") AS total_quantity_sold
FROM transactions
GROUP BY "StockCode", "Description"
ORDER BY total_revenue DESC
LIMIT 10;


-- 5. Customer Ranking by Spend
SELECT
    "Customer ID",
    ROUND(SUM("TotalPrice")::numeric, 2) AS total_spend,
    RANK() OVER (ORDER BY SUM("TotalPrice") DESC) AS spend_rank
FROM transactions
GROUP BY "Customer ID"
ORDER BY spend_rank
LIMIT 10;