# Retail Sales and Customer Behavior Analysis (SQL & Python Project)

## Project Overview

This project provides an end-to-end retail sales and customer behavior analysis using **MySQL** for relational data querying and **Python (Pandas & Matplotlib)** for exploratory data analysis and visualization. 

The project covers data processing across 2,000 retail transaction records—from relational database setup, strict data cleaning, and explicit `NULL` handling to profitability analysis, customer demographic segmentation, and time-series sales trends.

The primary goal is to demonstrate practical analytics capabilities in answering key business questions, identifying profit drivers, and understanding customer purchasing habits.

---

## Repository Structure

```text
retail-sales-analysis/
│
├── data/
│   └── SQL - Retail Sales Analysis_utf .csv   -- Raw transactional dataset (2,000 records)
│
├── sql/
│   └── retail_sales_analysis.sql             -- Consolidated SQL script (Schema + Cleaning + Analysis)
│
├── retail_analysis.ipynb                     -- Complete data visualizations
└── README.md                                 -- Complete project documentation and findings
## Database Schema & Setup

## 📊 Data Visualizations

All visual charts, monthly trend lines, and demographic segmentations were generated using Python (`pandas` and `matplotlib`). 

👉 **[Click here to view all interactive charts in the Jupyter Notebook](./retail_analysis.ipynb)**

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
