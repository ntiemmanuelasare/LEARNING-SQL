-- As a data analyst, it is important to efficiently query the database in order to extract relevant information for analysis. Here are some tips for efficiently querying the market research database:

-- Use appropriate indices: Indices can help speed up queries by allowing the database to quickly locate specific records. Consider creating indices on columns that are frequently used in WHERE clauses or JOIN conditions.

-- Use appropriate data types: Using the correct data type for a column can help improve query performance. For example, using a VARCHAR data type for a column that only contains numerical values will require the database to do additional work to convert the values to a numeric data type before performing calculations.

-- Use LIMIT and OFFSET clauses: If you only need a specific number of rows or a specific range of rows, you can use the LIMIT and OFFSET clauses to efficiently retrieve the desired rows.

-- Use EXPLAIN before SELECT statements: The EXPLAIN keyword can be used to see how the database will execute a SELECT statement. This can help identify any potential performance issues, such as missing indices or inefficient query plans.

-- Use EXPLAIN ANALYZE for more detailed information: The EXPLAIN ANALYZE keyword will not only show the query plan, but also provide actual execution times for each step of the plan. This can help identify specific bottlenecks in the query.

-- Example query:

-- Find the total amount of shampoo sold in Berlin
SELECT SUM(s.amount)
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
WHERE c.location = 'Berlin' AND p.name = 'Shampoo';

-- Find the average age of customers who have purchased a product in the Personal Care category
SELECT AVG(c.age)
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
WHERE p.category = 'Personal Care';

-- Find the top 3 most popular products based on total number of units sold
SELECT p.name, SUM(s.amount) as total_units_sold
FROM sales s
JOIN product p ON p.product_id = s.product_id
GROUP BY p.name
ORDER BY total_units_sold DESC
LIMIT 3;

-- Find the total amount of sales made by male customers in Hamburg
SELECT SUM(s.amount * p.price) as total_sales
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
WHERE c.gender = 'M' AND c.location = 'Hamburg';

-- Find the average price of all products sold in Munich
SELECT AVG(p.price)
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
WHERE c.location = 'Munich';

-- Find the total sales for each customer
SELECT c.name, SUM(s.amount * p.price) as total_sales
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
GROUP BY c.name;

-- Find the top 5 most popular products
SELECT p.name, SUM(s.amount) as total_sold
FROM sales s
JOIN product p ON p.product_id = s.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;

-- Find the average purchase amount for each customer
SELECT c.name, AVG(s.amount * p.price) AS avg_purchase_amount
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
GROUP BY c.name
ORDER BY avg_purchase_amount DESC;


-- Find the top 3 most popular products in each location
SELECT c.location, p.name, SUM(s.amount) as total_sold
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
GROUP BY c.location, p.name
ORDER BY c.location, total_sold DESC
LIMIT 3;


-- Find the total sales by gender and location for each product category
SELECT p.category, c.gender, c.location, SUM(s.amount * p.price) AS total_sales
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
WHERE p.category IN (SELECT DISTINCT category FROM product WHERE price > 10)
GROUP BY p.category, c.gender, c.location
HAVING SUM(s.amount * p.price) > 100;

-- Find the total revenue for each product category, broken down by location
SELECT p.category, c.location, SUM(s.amount * p.price) AS total_revenue
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
GROUP BY p.category, c.location;


-- Find the top 3 product categories by sales for the past year
SELECT p.category, SUM(s.amount * p.price) AS total_sales, RANK() OVER (ORDER BY SUM(s.amount * p.price) DESC) AS ranking
FROM sales s
JOIN product p ON p.product_id = s.product_id
WHERE s.date >= DATEADD(year, -1, GETDATE())
GROUP BY p.category
ORDER BY total_sales DESC
LIMIT 3;

-- Find the total sales and average price of each product category in each location
SELECT c.location, p.category, SUM(s.amount) AS total_sales, AVG(p.price) AS avg_price
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
GROUP BY c.location, p.category;

-- Find the average age of customers who have purchased a product in the "Luxury" category and live in Berlin
SELECT AVG(c.age)
FROM customer c
JOIN sales s ON s.customer_id = c.customer_id
JOIN product p ON p.product_id = s.product_id
WHERE p.category = 'Luxury' AND c.location = 'Berlin';

-- Find the total sales for each product category in the past year
SELECT p.category, SUM(s.amount * p.price) AS total_sales
FROM sales s
JOIN customer c ON c.customer_id = s.customer_id
JOIN product p ON p.product_id = s.product_id
WHERE c.location = 'Munich' AND s.sale_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY p.category;





