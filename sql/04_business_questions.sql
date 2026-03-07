----------------------- Generic Queries -----------------------

-- How many citys are there in the sales data?

SELECT DISTINCT city
FROM sales;

-- In which city is each branch located?

SELECT branch, city
FROM sales
GROUP BY branch, city;

----------------------- Product Line Analysis -----------------------

-- How many unique product lines are there in the sales data?

SELECT DISTINCT product_line
FROM sales;

-- what is the most selling procuct line?

SELECT product_line, 
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_line
ORDER BY total_quantity DESC;

-- most common payment method

SELECT payment_method, 
    COUNT(payment_method) AS count
FROM sales
GROUP BY payment_method
ORDER BY count DESC;

-- What is the total revenue by month?

SELECT month, 
    SUM(total) AS total_revenue
FROM sales
GROUP BY month;

-- What month had the largest COGS (Cost of Goods Sold)?

SELECT MONTH,
    SUM(cogs) As total_cogs
FROM sales
GROUP BY month
ORDER BY total_cogs DESC;

-- What product line had the largest revenue?

SELECT product_line, 
    SUM(total) AS total_revenue 
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- What is the city with the largest revenue?

SELECT city,
    sum(total) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;

-- What product line had the largest VAT?

SELECT product_line, 
    SUM(VAT) AS total_vat  
FROM sales
GROUP BY product_line
ORDER BY total_vat DESC;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

SELECT AVG(quantity) as avg_qnt
FROM sales

Select product_line, 
    SUM(quantity) AS total_quantity,
    (CASE 
        WHEN SUM(quantity) > (SELECT AVG(quantity) FROM sales) THEN 'Good'
        ELSE 'Bad'
    END) AS performance
FROM sales
GROUP BY product_line   

-- Which branch sold more products than average product sold?

SELECT branch, 
    SUM(quantity) AS total_quantity,
    (CASE 
        WHEN SUM(quantity) > (SELECT AVG(quantity) FROM sales) THEN 'Good'
        ELSE 'Bad'
    END) AS performance
FROM sales
GROUP BY branch

-- What is the most common product line by gender?

select gender,
    product_line,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY gender, product_line
ORDER BY total_quantity DESC;

-- What is the average rating of each product line?

SELECT product_line,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY product_line  

---------------------- Sales Analysis ------------------

-- Number of sales made in each time of the day per weekday

select time_of_day, day_of_week, 
    COUNT(invoice_id) AS total_sales
FROM sales
GROUP BY time_of_day, day_of_week
ORDER BY total_sales DESC;

-- Which of the customer types brings the most revenue?

Select customer_type,
    SUM(total) AS total_revenue
from sales
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?

select city,
    SUM(VAT) AS total_vat
FROM sales
GROUP BY city
ORDER BY total_vat DESC;

-- Which customer type pays the most in VAT?

select customer_type,
    SUM(VAT) AS total_vat
FROM sales
GROUP BY customer_type
ORDER BY total_vat DESC;

----------------- Customer Analysis -----------------

-- How many unique customer types does the data have?

select DISTINCT customer_type
from sales;

-- What is the most common customer type?

select customer_type,
    COUNT(customer_type) AS count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;

-- Which customer type buys the most?

select customer_type,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY customer_type
ORDER BY total_quantity DESC;

-- What is the gender of most of the customers?

select gender,
    COUNT(gender) AS count
FROM sales
GROUP BY gender
ORDER BY count DESC;

-- What is the gender distribution per branch?

select branch, gender,
    COUNT(gender) AS count
FROM sales  
GROUP BY branch, gender
ORDER BY count DESC;

-- Which time of the day do customers give most ratings?

select time_of_day,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which time of the day do customers give most ratings per branch?

select time_of_day, branch,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day, branch
ORDER BY avg_rating DESC;

-- Which day of the week has the best avg ratings?

Select day_of_week,
    AVG(rating) AS avg_rating
from sales
GROUP BY day_of_week
ORDER BY avg_rating DESC;

-- Which day of the week has the best average ratings per branch?

Select day_of_week, branch,
    AVG(rating) AS avg_rating
from sales
GROUP BY day_of_week, branch
ORDER BY avg_rating DESC;

