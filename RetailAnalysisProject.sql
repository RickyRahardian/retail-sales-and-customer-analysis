Create Table tb_retailsales_data(
	transactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(20),
	age INT,
	category VARCHAR (20),
	quantity INT,
	price_per_unit DECIMAL(10,2),
	cogs DECIMAL(10,2),
	total_sale DECIMAL(10,2) 
);

-- Data cleaning completed: NULL values handled in excel (13 data null)
select count(*) from tb_retailsales_data;

-- DATA EXPLORATION

-- a) Total Sales / Transactions
Select count(*) as Total_Sales from tb_retailsales_data;

-- b) Total Customers
Select count(distinct customer_id) as Total_Customers from tb_retailsales_data;

-- c) Total Category
Select count(distinct category) as Total_Category from tb_retailsales_data;

-- DATA ANALYSIS

-- 1) Sales Performance & Profitability Analysis

-- 1.1 Overall Summary: Total Revenue, Total Cost, Total Profit, and Profit Margin
SELECT 
    COUNT(transactions_id) AS total_transactions,
    SUM(quantity) AS total_units_sold,
    SUM(total_sale) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(total_sale - cogs) AS net_profit,
    ROUND((SUM(total_sale - cogs) / SUM(total_sale)) * 100, 2) AS profit_margin_pct
FROM tb_retailsales_data;

-- 1.2 Category Performance & Profitability Breakdown
SELECT 
    category,
    COUNT(transactions_id) AS total_transactions,
    SUM(quantity) AS total_units_sold,
    SUM(total_sale) AS total_revenue,
    SUM(cogs) AS total_cogs,
    SUM(total_sale - cogs) AS net_profit,
    ROUND(AVG(price_per_unit), 2) AS avg_unit_price
FROM tb_retailsales_data
GROUP BY category
ORDER BY net_profit DESC;

-- 2) Customer Demographics and Segmentation

-- 2.1) Customers Segmentation by Age Group
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25 (Gen Z)'
        WHEN age BETWEEN 26 AND 40 THEN '26-40 (Millennial)'
        WHEN age BETWEEN 41 AND 60 THEN '41-60 (Gen X)'
        WHEN age > 60 THEN '> 60 (Senior)'
        ELSE 'Unknown Age'
    END AS age_group,
    COUNT(transactions_id) AS total_transactions,
    SUM(total_sale) AS total_revenue,
    ROUND(AVG(total_sale), 2) AS avg_order_value
FROM tb_retailsales_data
GROUP BY age_group
ORDER BY total_revenue DESC;

-- 2.2) Purchasing Behavior by Gender
SELECT 
    gender,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(transactions_id) AS total_transactions,
    SUM(quantity) AS total_units_bought,
    SUM(total_sale) AS total_spend,
    ROUND(AVG(total_sale), 2) AS avg_order_value
FROM tb_retailsales_data
GROUP BY gender;

-- 3) Time Series and Trend Analysis

-- 3.1) Monthly Sales Revenue Trend
SELECT
	date_format(sale_date, '%Y-%m') as Sales_Month,
    count(transactions_id) as Total_Transactions,
    sum(quantity) as Total_Units_Sold,
    sum(total_sale) as Total_Revenue
FROM tb_retailsales_data
GROUP BY Sales_Month
ORDER BY Sales_Month ASC;

-- 3.2) Top 10 Peak Shopping Hours Analysis
SELECT
	HOUR(sale_time) as Transaction_Hour,
    count(transactions_id) as Total_Transaction,
    sum(quantity) as Total_Units_Sold,
    sum(total_sale) as Total_Revenue
FROM tb_retailsales_data
Group by Transaction_Hour
Order by Total_Transaction DESC
LIMIT 10;

-- 3.3) Weekday vs Weekend Sales
SELECT
	CASE
		WHEN DAYOFWEEK(sale_date) in (1,7) then 'Weekend'
        Else 'Weekday'
	End as Day_Type,
    count(transactions_id) as Total_Transaction,
    sum(quantity) as Total_Units_Sold,
    sum(total_sale) as Total_Revenue
FROM tb_retailsales_data
Group by Day_Type;

-- 4) Behavioral Cross-Analysis & Outliers

-- 4.1) High-Value Transactions Filter (> $1,000)
SELECT *
FROM tb_retailsales_data
WHERE total_sale > 1000
ORDER BY total_sale DESC;

-- 4.2) Product Category Preference by Gender
SELECT 
    gender,
    category,
    COUNT(transactions_id) AS transaction_count,
    SUM(total_sale) AS category_revenue
FROM tb_retailsales_data
GROUP BY gender, category
ORDER BY gender, category_revenue DESC;