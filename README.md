# Superstore Profitability & Customer Segmentation (RFM Analysis)

##  Project Overview

sales data analysis for superstores, from data cleaning to dashboard creation, identifying profit leaks and segmenting customers using RFM analysis to recommend business strategies.

---

## Tools
- SQL (PostgreSQL/MySQL): Data Cleaning, Aggregation, Window Functions
- Power BI / Google Sheets: Data Visualization, Dashboarding, Data Storytelling

##  Business Objectives

1. Customer Health: Who are the major customers we're losing, and how can we retain them?
2. Profit Trend: Do the monthly sales growth reflect the company's true profits?
3. Product Optimization: Which product categories are selling more, and what are the reasons?

---

##  Dataset

**Source**: Sample Superstore (Retail Sales Data)

**Period**: January 2014 - December 2017

**Records**: 9,994 transactions

**The data has clean before**

**Fields**:
- Order details: Order ID, Order Date, Ship Date, Ship Mode
- Customer info: Customer ID, Customer Name, Segment
- Location: Region, State, City
- Product info: Category, Sub-Category, Product Name
- Metrics: Sales, Quantity, Discount, Profit

---

##  Project Workflow

### 1. Data Cleaning & Preparation (SQL)
- Imported CSV data into Google Sheets
- Understanding the business and data tell me what?
- Convert dataset to .db for wraggling with data
- Solve the Split Line Items problem (customers ordering the same item repeatedly in the same order) by using SUM() and AVG() to merge line counts and prevent overstated sales.

### 2. Customer Segmentation (SQL RFM Model)
- Use RFM (Recency, Frequency, Monetary) techniques to assess customer behavior.
- Use Window Function NTILE(4) to score (Scoring) and divide customers into 6 groups such as Champions, Loyal Customers, At Risk and Hibernation.

### 3. Data Visualization (Power BI / Google Sheets)
- Design a Strategic Dashboard divided into 3 zones:
  - Zone A (Business Health): View sales trends compared to profits using a Combo Chart (Dual-Axis).
  - Zone B (Customer Strategy): Analyze customer segment proportions.
  - Zone C (Product Profitability): Identify the products with the highest profitability and losses.
 
---
## Insights & Findings

### 1. Warning signals from "At Risk" customer groups.
  - 149 customers were identified as "At Risk," with an average spending of $4,027 per person (almost as high as VIP customers). If no action is taken, the company could lose this revenue stream.
  - The largest group is "Hibernation" (sleeping): 248 people made a purchase and then disappeared, indicating a problem with customer retention.

### 2. The illusion of year-end sales (Profit Leakage)
  - The Combo Chart shows that towards the end of the year (e.g., December 2017), sales reach a new high, but the profit curve does not grow proportionally. This indicates that overly aggressive price reductions are eroding profits.

### 3. Loss driver
  - A deeper dive into sub-categories reveals that furniture, particularly tables and bookcases, exhibits significant negative profit figures; the more the company sells, the more it loses money.

---

## Business Recommendations

### 1. Revise Discount Policy: Immediately eliminate or limit the discount cap for Tables and Bookcases product categories to stop the situation of selling at a loss.
### 2. Win-back Campaign: A personalized marketing campaign was implemented targeting 149 "At Risk" customers, offering them exclusive benefits to encourage them to become loyal customers again.
### 3. Focus on Retention: Identify the reasons why 248 customers became hibernating in order to improve their post-purchase experience.
