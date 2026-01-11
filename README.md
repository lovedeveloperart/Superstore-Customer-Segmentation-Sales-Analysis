# Superstore Customer Segmentation & Sales Analysis

##  Project Overview

This end-to-end data analytics project analyzes the Sample Superstore dataset to uncover customer purchasing patterns, identify high-value customer segments, and provide actionable insights for marketing and discount strategies. The project demonstrates proficiency in **SQL**, **Google Sheets**, and **data-driven decision making** — essential skills for data analyst roles.

---

##  Business Objectives

1. **Understand customer behavior** across different segments (Consumer, Corporate, Home Office)
2. **Identify high-value and at-risk customers** using RFM (Recency, Frequency, Monetary) analysis
3. **Analyze discount impact** on profitability across product categories and regions
4. **Provide actionable recommendations** to optimize marketing spend and pricing strategies

---

##  Dataset

**Source**: Sample Superstore (Retail Sales Data)

**Period**: January 2014 - December 2017

**Records**: 9,994 transactions

**Key Fields**:
- Order details: Order ID, Order Date, Ship Date, Ship Mode
- Customer info: Customer ID, Customer Name, Segment
- Location: Region, State, City
- Product info: Category, Sub-Category, Product Name
- Metrics: Sales, Quantity, Discount, Profit

---

## 🛠️ Tools & Technologies

- **SQL** (PostgreSQL/MySQL): Data extraction, aggregation, and RFM segmentation
- **Google Sheets**: Data cleaning, pivot tables, and interactive dashboard
- **Python** (Pandas): Data preprocessing and feature engineering

---

## 📋 Project Workflow

### 1. Data Preparation & Cleaning
- Imported CSV data into Google Sheets
- Converted date fields to proper format
- Created calculated fields:
  - `Profit Margin = Profit / Sales`
  - `Order Year`, `Order Month`, `Order YearMonth`
  - `Discount Flag` (Discounted vs No Discount)

### 2. Exploratory Data Analysis (EDA)

#### Key Findings:

**Sales & Profit by Segment**
- **Consumer**: $1,161,401 in sales (50.5%), $134,119 profit (11.55% margin)
- **Corporate**: $706,146 in sales (30.7%), $91,979 profit (13.03% margin)
- **Home Office**: $429,653 in sales (18.7%), $60,299 profit (14.03% margin)

**Sales & Profit by Region**
- **West**: Highest sales ($725,458) and best profit margin (14.94%)
- **Central**: Lowest profit margin (7.92%) despite $501,240 in sales

**Sales & Profit by Category**
- **Technology**: Best performer with 17.40% profit margin
- **Furniture**: Weakest category with only 2.49% profit margin
- **Office Supplies**: Strong margins at 17.04%

**Discount Impact Analysis**
- **No Discount**: $1,087,908 sales, $320,988 profit (avg $66.90 per transaction)
- **Low Discount (0-20%)**: $846,522 sales, $100,785 profit (avg $26.50 per transaction)
- **Medium Discount (20-40%)**: $234,138 sales, **-$35,817 loss** (avg -$77.86 per transaction)
- **High Discount (40%+)**: $128,632 sales, **-$99,559 loss** (avg -$106.71 per transaction)

** Problem Products**: 
- High discounts (>30%) on **Binders**, **Tables**, **Machines**, and **Bookcases** are causing significant losses
- Furniture category is particularly vulnerable to discount-driven losses

### 3. Customer Segmentation (RFM Analysis)

#### RFM Methodology:
- **Recency (R)**: Days since last purchase (lower = better)
- **Frequency (F)**: Number of orders (higher = better)
- **Monetary (M)**: Total sales value (higher = better)

Each customer scored 1-4 on R, F, M dimensions using quartile-based scoring.

#### Customer Segments Defined:

| Segment | Criteria | Count | Total Sales | Sales % | Avg Orders |
|---------|----------|-------|-------------|---------|------------|
| **At Risk** | High M, Low R | 166 | $786,138 | 34.2% | 7.05 |
| **Loyal** | High R, High F | 134 | $452,147 | 19.7% | 8.49 |
| **VIP** | High R, F, M | 90 | $404,324 | 17.6% | 9.01 |
| **High-Value Recent** | High R, High M | 62 | $284,737 | 12.4% | 5.18 |
| **Lost** | Low R, Low F | 193 | $200,848 | 8.7% | 4.07 |
| **Regular** | Mid-range scores | 148 | $169,007 | 7.4% | 5.30 |

#### Segment Insights:

** At Risk (34.2% of sales)**: 
- Highest revenue contributors but haven't purchased recently
- Average 15% discount rate
- **Action**: Re-engagement campaigns, personalized offers

** VIP (17.6% of sales)**:
- 90 customers driving significant revenue
- High purchase frequency (9 orders average)
- **Action**: Loyalty programs, exclusive perks, early access

** Loyal (19.7% of sales)**:
- Frequent buyers, consistent engagement
- **Action**: Maintain satisfaction, upsell opportunities

** Lost (8.7% of sales)**:
- 193 customers with low frequency and high recency
- **Action**: Win-back campaigns with incentives (but avoid heavy discounts)

---

##  Key Insights

### 1. Discount Strategy Issues
- Discounts above 20% consistently result in negative profitability
- Binders category: $36,141 sales but **-$38,511 loss** from excessive discounts
- Tables category: $88,219 sales but **-$30,761 loss**

### 2. Customer Concentration Risk
- Top 166 "At Risk" customers represent 34% of total sales
- If these customers churn, revenue impact would be severe

### 3. Product Performance
- **Copiers** and **Accessories** show strong profitability (37% and 25% margins)
- **Tables** and **Bookcases** in Furniture category are loss-makers (-8.56% and -3.02% margins)

### 4. Regional Opportunities
- Central region has lowest profit margin (7.92%) despite strong sales
- Indicates potential for cost optimization or pricing adjustments

---

##  Recommendations

### 1. Revise Discount Policy
- **Eliminate discounts > 30%** on all products
- **Cap discounts at 20%** for Furniture (especially Tables, Bookcases, Chairs)
- Focus discounts on high-margin products (Technology, Office Supplies)

### 2. Customer Retention Strategy
- **At Risk segment**: Deploy targeted email campaigns, exclusive offers, and personalized recommendations within next 30 days
- **VIP segment**: Launch loyalty program with tiered benefits, early product access, and dedicated support
- **Lost segment**: Limited win-back campaign with time-bound offers (avoid deep discounts)

### 3. Product Portfolio Optimization
- **Phase out or re-price** unprofitable Tables and Bookcases models
- **Expand** high-margin products: Copiers, Accessories, Phones
- **Reduce inventory** of loss-making Furniture items

### 4. Regional Strategy
- **Central region**: Investigate high operational costs or adjust pricing
- **West region**: Maintain current strategy (best performance)

---

##  Dashboard (Google Sheets)

The interactive dashboard includes:

### Key Metrics Cards
- Total Sales: $2,297,201
- Total Profit: $286,397
- Overall Profit Margin: 12.47%
- Total Orders: 5,009
- Total Customers: 793

### Visualizations
1. **Sales & Profit by Customer Segment** (Bar Chart)
2. **Sales by Category** (Pie Chart)
3. **Monthly Sales Trend** (Line Chart)
4. **Discount vs Profit Margin** (Scatter Plot)
5. **Top 10 Sub-Categories by Sales** (Bar Chart)
6. **Regional Performance** (Table)

** [View Dashboard](YOUR_GOOGLE_SHEETS_LINK_HERE)**

---

##  Repository Structure

```
superstore-customer-segmentation/
│
├── data/
│   ├── Sample-Superstore.csv              # Original dataset
│   ├── customer_segmentation.csv          # Customer-level RFM data
│   └── transaction_with_segments.csv      # Transaction data with segments
│
├── sql/
│   ├── 01_EDA.sql                         # Exploratory analysis queries
│   └── 02_CUSTOMER_SEGMENTATION.sql       # RFM segmentation queries
│
├── sheets/
│   └── dashboard_link.txt                 # Link to Google Sheets dashboard
│
├── notebooks/
│   └── data_analysis.ipynb                # Python analysis (optional)
│
└── README.md                              # Project documentation
```

---

##  How to Reproduce

### Prerequisites
- PostgreSQL/MySQL database
- Google Sheets account
- Python 3.8+ (optional)

### Steps

1. **Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/superstore-customer-segmentation.git
cd superstore-customer-segmentation
```

2. **Load data into database**
```sql
CREATE TABLE superstore (
    "Row ID" INT,
    "Order ID" VARCHAR(50),
    "Order Date" DATE,
    "Ship Date" DATE,
    "Ship Mode" VARCHAR(50),
    "Customer ID" VARCHAR(50),
    "Customer Name" VARCHAR(100),
    "Segment" VARCHAR(50),
    "Country" VARCHAR(50),
    "City" VARCHAR(100),
    "State" VARCHAR(50),
    "Postal Code" INT,
    "Region" VARCHAR(50),
    "Product ID" VARCHAR(50),
    "Category" VARCHAR(50),
    "Sub-Category" VARCHAR(50),
    "Product Name" VARCHAR(255),
    "Sales" DECIMAL(10,2),
    "Quantity" INT,
    "Discount" DECIMAL(3,2),
    "Profit" DECIMAL(10,2)
);

COPY superstore FROM '/path/to/Sample-Superstore.csv' DELIMITER ',' CSV HEADER;
```

3. **Run SQL queries**
```bash
psql -U username -d database -f sql/01_EDA.sql
psql -U username -d database -f sql/02_CUSTOMER_SEGMENTATION.sql
```

4. **Import data to Google Sheets**
- Open Google Sheets
- Import `customer_segmentation.csv`
- Create pivot tables and charts
- Build dashboard layout

---

##  Skills Demonstrated

✅ **SQL**: Complex queries, CTEs, window functions, aggregations, RFM scoring  
✅ **Data Analysis**: EDA, segmentation, profitability analysis, trend analysis  
✅ **Business Acumen**: Translating data into actionable insights and recommendations  
✅ **Data Visualization**: Dashboard design, chart selection, storytelling with data  
✅ **Problem Solving**: Identifying profit leakages and optimization opportunities  

---

##  Author

**Your Name**  
Data Analyst | Business Intelligence  
[LinkedIn](YOUR_LINKEDIN) | [GitHub](YOUR_GITHUB) | [Email](YOUR_EMAIL)

---

##  License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

##  Acknowledgments

- Dataset: Sample Superstore from Tableau Public
- Inspiration: Real-world retail analytics and customer segmentation practices
