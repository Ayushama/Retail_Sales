use retail_sales; 

SELECT * FROM retail_sales_dataset LIMIT 5;

SELECT COUNT(*) FROM retail_sales_dataset;

ALTER TABLE retail_sales_dataset ADD COLUMN Date_fixed DATE;
update retail_sales_dataset SET Date_fixed = STR_TO_DATE(Date, '%d-%m-%Y');

SELECT Date, Date_fixed FROM retail_sales_dataset LIMIT 5;

select distinct 'Product Category' from retail_sales_dataset;
select gender, count(*) As cnt from retail_sales_dataset group by gender;

ALTER TABLE retail_sales_dataset 
CHANGE `Product Category` product_category VARCHAR(50),
CHANGE `Price per Unit` price_per_unit DECIMAL(10,2),
CHANGE `Total Amount` total_amount DECIMAL(10,2),
CHANGE `Transaction ID` transaction_id INT,
CHANGE `Customer ID` customer_id VARCHAR(20);

select transaction_id, customer_id, Date_fixed, product_category, total_amount from retail_sales_dataset
order by total_amount desc ;

SELECT SUM(total_amount) AS total_sales, AVG(total_amount) AS avg_sale
FROM retail_sales_dataset;

select product_category, count(*) As orders, Sum(total_amount) As sales from retail_sales_dataset
group by product_category order by sales desc;

SELECT customer_id, COUNT(*) AS orders, SUM(total_amount) AS total_spent
FROM retail_sales_dataset
GROUP BY customer_id
ORDER BY total_spent DESC LIMIT 10;

SELECT product_category, AVG(price_per_unit) AS avg_price
FROM retail_sales_dataset
GROUP BY product_category
ORDER BY avg_price DESC;

SELECT *  FROM retail_sales_dataset
WHERE STR_TO_DATE(`Date`, '%d-%m-%Y') 
      BETWEEN '2023-05-01' AND '2023-05-31'
ORDER BY STR_TO_DATE(`Date`, '%d-%m-%Y');

SELECT customer_id,
       SUM(total_amount) AS total_spent
FROM retail_sales_dataset
GROUP BY customer_id
ORDER BY total_spent DESC LIMIT 10;


-- Top 5 product categories by revenue 
select product_category, sum(total_amount) as revenue from retail_sales_dataset group by product_category 
order by revenue desc; 

-- Average spend per gender
select gender, round(avg(total_amount), 2) As avg_spend from retail_sales_dataset group by gender;

-- Age group segmentation
SELECT CASE 
          WHEN age BETWEEN 18 AND 25 THEN '18-25'
          WHEN age BETWEEN 26 AND 35 THEN '26-35'
          WHEN age BETWEEN 36 AND 50 THEN '36-50'
          ELSE '51+'
       END AS age_group,
       COUNT(*) AS num_orders,
       SUM(total_amount) AS total_revenue
FROM retail_sales_dataset
GROUP BY age_group
ORDER BY total_revenue DESC;

SELECT DATE_FORMAT(Date_fixed, '%Y-%m') AS month,
       SUM(total_amount) AS monthly_sales
FROM retail_sales_dataset
GROUP BY month
ORDER BY month;

SELECT customer_id,
       COUNT(*) AS num_orders,
       SUM(total_amount) AS total_spent
FROM retail_sales_dataset
GROUP BY customer_id
HAVING num_orders > 1
ORDER BY total_spent DESC
limit 5;

SELECT customer_id,
       MAX(date_fixed) AS last_purchase,
       COUNT(*) AS frequency,
       SUM(total_amount) AS monetary
FROM retail_sales_dataset
GROUP BY customer_id
ORDER BY monetary DESC
LIMIT 10;

SELECT DAYNAME(date_fixed) AS day_of_week,
       SUM(total_amount) AS total_sales,
       COUNT(*) AS orders
FROM retail_sales_dataset
GROUP BY day_of_week
ORDER BY total_sales DESC;

SELECT DATE_FORMAT(date_fixed, '%Y-%m') AS month,
       SUM(total_amount) AS monthly_sales,
       COUNT(*) AS orders
FROM retail_sales_dataset
GROUP BY month
ORDER BY month;























