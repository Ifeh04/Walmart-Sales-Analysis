-- Feature Engineering: Add derived columns for time-based analysis

-- Adding time of the day for future engineering

SELECT time,
       (CASE 
           WHEN time >= '00:00:00' AND time < '12:00:00' THEN 'Morning'
           WHEN time >= '12:00:00' AND time < '16:00:00' THEN 'Afternoon'
           ELSE 'Evening'
       END) AS time_of_day
FROM sales;

-- To add the result of the future engineering query to the table, we can use the following SQL statement:

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- the following query will update the new time_of_day column that is created in the previous query with the result of the future engineering query

UPDATE sales
SET time_of_day = (CASE 
                    WHEN time >= '00:00:00' AND time < '12:00:00' THEN 'Morning'
                    WHEN time >= '12:00:00' AND time < '16:00:00' THEN 'Afternoon'
                    ELSE 'Evening'
                 END);

-- Add day_column

SELECT TO_CHAR(date, 'Day') AS day_of_week
FROM sales;

ALTER TABLE sales ADD COLUMN day_of_week VARCHAR(15);

UPDATE sales
SET day_of_week = TO_CHAR(date, 'Day');

-- Add month_column

SELECT TO_CHAR(date, 'Month') AS month
FROM sales;

ALTER TABLE sales ADD COLUMN month VARCHAR(15);

UPDATE sales
SET month = TO_CHAR(date, 'Month');
