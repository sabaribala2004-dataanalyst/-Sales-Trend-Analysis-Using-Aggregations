DROP TABLE IF EXISTS online_sales CASCADE;

CREATE TABLE online_sales (
  order_id SERIAL PRIMARY KEY,
  order_date DATE,
  product_id INT,
  customer_id INT,
  region VARCHAR(50),
  state VARCHAR(50),
  city VARCHAR(50),
  payment_method VARCHAR(30),
  quantity INT,
  price_per_unit NUMERIC(10,2),
  amount NUMERIC(12,2),
  discount NUMERIC(5,2),
  profit NUMERIC(12,2)
);

INSERT INTO online_sales 
(order_date, product_id, customer_id, region, state, city, payment_method, quantity, price_per_unit, amount, discount, profit)
VALUES
('2024-01-05', 101, 1001, 'South', 'Tamil Nadu', 'Chennai', 'UPI', 2, 1200, 2400, 5.0, 500),
('2024-01-12', 102, 1002, 'West', 'Maharashtra', 'Mumbai', 'Credit Card', 1, 1800, 1800, 0.0, 400),
('2024-01-20', 103, 1003, 'North', 'Delhi', 'Delhi', 'Net Banking', 3, 1000, 3000, 10.0, 600),

('2024-02-04', 104, 1004, 'South', 'Karnataka', 'Bengaluru', 'Cash', 2, 1500, 3000, 0.0, 800),
('2024-02-15', 105, 1005, 'East', 'West Bengal', 'Kolkata', 'Debit Card', 1, 4000, 4000, 15.0, 900),

('2024-03-09', 106, 1006, 'South', 'Tamil Nadu', 'Madurai', 'UPI', 1, 2200, 2200, 0.0, 700),
('2024-03-18', 107, 1007, 'West', 'Maharashtra', 'Pune', 'UPI', 2, 1700, 3400, 5.0, 1000),

('2024-04-07', 108, 1008, 'North', 'Punjab', 'Amritsar', 'Credit Card', 3, 1500, 4500, 0.0, 1200),
('2024-04-25', 109, 1009, 'West', 'Goa', 'Panaji', 'Cash', 2, 1400, 2800, 10.0, 700),

('2024-05-11', 110, 1010, 'East', 'Odisha', 'Bhubaneswar', 'Net Banking', 5, 1000, 5000, 0.0, 1500),
('2024-05-19', 103, 1003, 'North', 'Delhi', 'Delhi', 'UPI', 2, 1300, 2600, 5.0, 600),

('2024-06-04', 111, 1011, 'South', 'Kerala', 'Kochi', 'Debit Card', 3, 1200, 3600, 0.0, 1000),
('2024-06-15', 101, 1001, 'South', 'Tamil Nadu', 'Chennai', 'UPI', 4, 1050, 4200, 0.0, 1200);

-----1) Monthly Revenue & Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume,
    SUM(profit) AS monthly_profit
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

--------2) Top 3 Months by Sales
WITH monthly_sales AS (
    SELECT
        EXTRACT(YEAR FROM order_date) AS order_year,
        EXTRACT(MONTH FROM order_date) AS order_month,
        SUM(amount) AS total_sales
    FROM online_sales
    GROUP BY order_year, order_month
)
SELECT order_year, order_month, total_sales
FROM monthly_sales
ORDER BY total_sales DESC
LIMIT 3;

------3) Revenue Trend (VIEW)
CREATE OR REPLACE VIEW monthly_revenue_trend AS
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(amount) AS revenue,
    SUM(profit) AS profit,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY sales_month
ORDER BY sales_month;

-------4) Revenue by Region (Monthly Split)
SELECT
    region,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM online_sales
GROUP BY region, order_year, order_month
ORDER BY order_year, order_month, total_revenue DESC;

------5) Top 5 States by Profit
SELECT
    state,
    SUM(profit) AS total_profit
FROM online_sales
GROUP BY state
ORDER BY total_profit DESC
LIMIT 5;

----6 )Payment Method Breakdown
SELECT
    payment_method,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_sales,
    ROUND(100.0 * SUM(amount) / (SELECT SUM(amount) FROM online_sales), 2) AS pct_of_total_sales
FROM online_sales
GROUP BY payment_method
ORDER BY total_sales DESC;

-------7)Top 5 Products by Revenue
SELECT
    product_id,
    SUM(amount) AS total_revenue,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS total_orders
FROM online_sales
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 5;

----8) Customer Purchase Frequency & Revenue
SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_spent,
    SUM(profit) AS total_profit
FROM online_sales
GROUP BY customer_id
ORDER BY total_spent DESC;

----9) City-wise Revenue & Profit
SELECT
    city,
    state,
    SUM(amount) AS total_revenue,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS order_count
FROM online_sales
GROUP BY state, city
ORDER BY total_revenue DESC;

----- 10) Average Order Value & Quantity per Month
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    ROUND(AVG(amount), 2) AS avg_order_value,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Query the view
SELECT * FROM monthly_revenue_trend;

