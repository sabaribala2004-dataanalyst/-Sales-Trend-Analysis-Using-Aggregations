# 📊 SQL Sales Trend Analysis   <!-- Online Sales Database -->

## 📌 Description   <!-- Section Heading -->
This project is part of a **Data Analyst Internship Task (Task 6)**.  
The dataset used is an **Online Sales Database**, created and queried using SQL.  

The main objective of this task was to **analyze sales trends over time using SQL aggregations**.  
Queries cover **monthly revenue, order volume, top-performing periods, and payment insights**, with additional breakdowns by region, state, and product.  

## 🔑 Key Tasks Performed   <!-- Section Heading -->

- Created `online_sales` table with fields for orders, customers, region, and transactions.  
- Inserted sample dataset into PostgreSQL.  
- Analyzed **monthly revenue & order volume** using aggregation functions.  
- Identified **Top 3 Months by Sales** with CTE & LIMIT.  
- Built a **SQL View** for monthly revenue trends.  
- Explored **region-wise and state-wise performance**.  
- Examined **payment method breakdown** and contribution to sales.  
- Ranked **top products** by revenue & profit.  
- Conducted **customer and city-level analysis**.  
- Calculated **average order value & quantity per month**.  

## 📊 Dataset   <!-- Section Heading -->

- Source: Internship Online Sales SQL dataset  
- Table: `online_sales` (orders table with `order_date`, `amount`, `product_id`, `customer_id`, etc.)  

## 🛠️ SQL Operations   <!-- Section Heading -->

### Table Creation & Data Loading   <!-- Sub-heading -->
- Defined schema with correct datatypes.  
- Inserted sales records manually into PostgreSQL.  

### Queries Implemented   <!-- Sub-heading -->
1. Monthly revenue & order volume (using `EXTRACT`, `SUM`, `COUNT`).  
2. Top 3 months by sales (using CTE + LIMIT).  
3. Revenue trend view (`CREATE VIEW`).  
4. Region-wise revenue split.  
5. Top 5 states by profit.  
6. Payment method breakdown with percentage contribution.  
7. Top 5 products by revenue & profit.  
8. Customer purchase frequency & revenue.  
9. City-wise revenue & profit analysis.  
10. Average order value & quantity per month.  

## 📂 Output   <!-- Section Heading -->
- SQL File: <a href="https://github.com/sabaribala2004-dataanalyst/Sales-Trend-Analysis-Using-Aggregations/blob/main/online_sales.sql"> Online Sales Queries </a>  
- Screenshots: Query outputs saved in report <a href="https://github.com/sabaribala2004-dataanalyst/Sales-Trend-Analysis-Using-Aggregations/blob/main/Query%20Outputs.pdf"> Click to View Results </a>  
- Key insights summarized in this README  

## ✅ Status   <!-- Section Heading -->
The project successfully demonstrates:  
- **Sales trend analysis using SQL**  
- **Monthly, regional, and product-level insights**  
- **Reusable reporting with views**  

This ensures the dataset is fully **analysis-ready** and SQL queries provide meaningful business insights.  
