-- EDA part
-- Check for negative sales figures.
SELECT 
	COUNT(*) 
FROM superstore
WHERE sales < 0;

--Check duplicate value
SELECT 
	order_id,
	product_id,
	COUNT(*) 
FROM superstore
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

-- In this case, you need to check the internal components to make sure they are all identical, such as the price and quantity of items.
SELECT *
FROM superstore
WHERE order_id = 'CA-2015-103135' AND product_id = 'OFF-BI-10000069';

-- Checking this section, it's not an exact match for all orders. This is because the customer placed an additional order after the original order, or the system separated the shipping lines.
-- Solution: The SUM(sales), SUM(quantity), and SUM(profit) data need to be aggregated into a single line.
CREATE TABLE superstore_clean AS
SELECT 
    -- Dimensions
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    states,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    
    -- Metrics 
    SUM(sales) AS sales,         
    SUM(quantity) AS quantity,    
    AVG(discount) AS discount,    
    SUM(profit) AS profit         

FROM superstore
GROUP BY 
    order_id, 
    order_date, 
    ship_date, 
    ship_mode, 
    customer_id, 
    customer_name, 
    segment, 
    country, 
    city, 
    states, 
    postal_code, 
    region, 
    product_id, 
    category, 
    sub_category, 
    product_name;

SELECT order_id, product_id, COUNT(*)
FROM superstore_clean
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

-- And then after dealing with duplicate we need check data quality
SELECT 
	COUNT(*) - COUNT(customer_id) AS missing_customer_id,
	COUNT(*) - COUNT(region) AS missing_region,
	COUNT(*) - COUNT(order_date) AS missing_order_date
FROM superstore_cleaned;

-- ## Part RFM Analysis
-- Create RFM metrics from raw data
CREATE VIEW customer_frm AS 
SELECT 
  customer_id,
  customer_name,
  JULIANDAY('2017-12-31') - JULIANDAY(MAX(order_date)) AS recency_days,
  COUNT(DISTINCT order_id) AS frequency,
  SUM(sales) AS monetary_value
FROM superstore_clean
GROUP BY customer_id, customer_name;
-- Note: Since SQLite doesn't have a DATEDIFF function, I used JULIANDAY instead, which is the last day minus MAX orde_date, because the dataset only goes up to December 2017. 

-- And then Customer rating (scoring with NTILE) - Here, NTILE is divided into 4 categories.
CREATE TABLE customer_segmentation AS 
WITH frm_scored AS (
  SELECT 
    *,
    NTILE(4) OVER (ORDER BY recency_days DESC) AS r_score,
    NTILE(4) OVER (ORDER BY frequency ASC) AS f_score,
    NTILE(4) OVER (ORDER BY monetary_value ASC) AS m_score
  FROM customer_frm
)
SELECT 
  *,
  CONCAT(r_score,f_score,m_score) AS rfm_str,
  (r_score + f_score + m_score) AS total_score
FROM frm_scored;

SELECT * FROM customer_segmentation
ORDER BY total_score DESC
LIMIT 5;

/* In this phase, we've obtained various values, but they are still numbers that stakeholders don't understand. Only we understand them. We need to convert these rating scores into names, for example:
 To map the `r_score` + `f_score` scores into group names using standard international logic:
 1. **Champions (VIP):** Frequent buyers, heavy buyers, and recent buyers (scores 4-5)
 2. **Loyal Customers:** Very frequent buyers, but their recency may have decreased somewhat.
 3. **Potential Loyalist:** New customers with potential.
 4. **At Risk:** Previously frequent buyers, but have been inactive for a while (we need to bring them back!).
 5. **Hibernating (Lost):** Infrequent buyers and have been absent for a long time. 
The final phase of RFM is mapping and categorizing customer roles. 
*/

CREATE TABLE customer_segment_final AS 
SELECT 
  customer_id,
  customer_name,
  recency_days,
  frequency,
  monetary_value,
  r_score,
  f_score,
  m_score,
  rfm_str,

  CASE
        WHEN (r_score >= 4 AND f_score >= 4) THEN 'Champions'
        WHEN (r_score >= 3 AND f_score >= 3) THEN 'Loyal Customers'
        WHEN (r_score >= 4 AND f_score <= 2) THEN 'New Customers'
        WHEN (r_score <= 2 AND f_score >= 3) THEN 'At Risk'
        WHEN (r_score <= 2 AND f_score <= 2) THEN 'Hibernation'
        ELSE 'Potential Loyalist'
  END AS customer_segment 
FROM customer_segmentation;

-- Final check after create group customer segmentation then check customer group 
SELECT 
    customer_segment,
    COUNT(*) as total_customers,
    SUM(monetary_value) as total_sales,
    ROUND(AVG(monetary_value),2) as avg_spend_per_user
FROM customer_segment_final
GROUP BY customer_segment
ORDER BY total_sales DESC;
