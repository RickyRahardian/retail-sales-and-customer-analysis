# Retail Sales and Customer Behavior Analysis (SQL Project)

## Project Overview

This project focuses on analyzing retail sales transaction data to derive actionable business insights using **MySQL**. The analysis covers end-to-end data processing—from database setup and data cleaning to customer demographic segmentation, category profitability, and peak time-series sales trends.

The primary goal is to demonstrate practical SQL capabilities in solving real-world business questions, identifying profit drivers, and understanding customer purchasing patterns.

---

## Key Business Questions Addressed

1. **Sales Performance & Profitability**: What are the total revenue, total cost, net profit, and overall profit margin? Which product categories drive the highest profit?
2. **Customer Demographics & Behavior**: How do sales vary across different age groups (Gen Z, Millennials, Gen X, Seniors) and genders?
3. **Time-Series Analysis**: What are the monthly revenue trends, peak shopping hours during the day, and sales comparisons between weekdays vs. weekends?
4. **High-Value Customer Transactions**: What are the patterns among high-value sales (> $1,000) and preference breakdowns by gender and category?

---

## Database Schema & Setup

### Table Structure

```sql
CREATE TABLE tb_retailsales_data (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(20),
    age INT,
    category VARCHAR(20),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);