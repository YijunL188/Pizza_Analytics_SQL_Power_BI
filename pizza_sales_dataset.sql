DROP TABLE IF EXISTS pizza_sales;
CREATE TABLE pizza_sales(
pizza_id INTEGER,
order_id INTEGER,
pizza_name_id VARCHAR(50),
quantity INTEGER,
order_date DATE,	
order_time TIME,	
unit_price NUMERIC,
total_price NUMERIC,	
pizza_size VARCHAR(50),	
pizza_category VARCHAR(50),	
pizza_ingredients VARCHAR(200),	
pizza_name VARCHAR(50)
);

