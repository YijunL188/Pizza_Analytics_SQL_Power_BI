SELECT *
FROM pizza_sales


----Part A Sales Analysis----
-- 1. What is the revenue generated for all orders by pizza category?
SELECT  pizza_category,
		order_date,
		ROUND(SUM(total_price),2) AS revenue
FROM pizza_sales
GROUP BY 1,2;

-- 2. Average order value by pizza category
SELECT pizza_category,
		ROUND((SUM(total_price) / COUNT(DISTINCT(order_id))),2) AS average_order_value
FROM pizza_sales
GROUP BY 1;

-- 3. What is the total quantity sold by pizza category?
SELECT  pizza_category,
		SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY 1;

-- 4. What is the total pizza order by category?
SELECT pizza_category,
		count(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 1;

-- 5. What is the average pizza per order by pizza category?
SELECT  pizza_category,
		CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL) AS average_pizza_order
FROM pizza_sales
GROUP BY 1;

-- 6. What is the daily trend for total order?
SELECT pizza_category,
       TO_CHAR(order_date,'Day') AS order_day,
	   COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 1,2
ORDER BY 1,2 DESC;

-- 7. What is the monthly trend for orders?
SELECT pizza_category,
       TO_CHAR(order_date, 'Month') AS order_month,
	   COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
GROUP BY 1,2;

-- 8. What is the sales percentage by pizza_category?
WITH sales_category AS(
	SELECT pizza_category,
		   SUM(total_price) AS total_sales
	FROM pizza_sales
	GROUP BY 1),

overall_sales AS(
    SELECT SUM(total_price) AS overall_total_sales
	FROM pizza_sales)
	
SELECT pizza_category,
       ROUND((total_sales),2) AS revenue,
	   ROUND((total_sales/overall_total_sales),2) * 100 AS sales_percentage
FROM sales_category, overall_sales;

-- 9. What is the sales percentage by pizza size?
WITH sales_pizzasize AS(
	SELECT pizza_size,
		   SUM(total_price) AS total_sales
	FROM pizza_sales
	GROUP BY 1),
	
overall_sales AS(
SELECT SUM(total_price) AS overall_total_sales
FROM pizza_sales)
	
SELECT pizza_size,
	   ROUND(total_sales,2),
	   ROUND((total_sales/overall_total_sales)* 100,2) AS sales_percentage
FROM sales_pizzasize , overall_sales;
	
-- 10. What is the top 5 revenue by pizza name?	
SELECT pizza_category,
       pizza_name,
	   SUM(total_price) AS total_sales
FROM pizza_sales
GROUP BY 1,2
ORDER BY 3 DESC;



