
---

### 🔹 File: `sql/01_schema_setup.sql`
```sql
-- Walmart Sales Table Schema
-- Created for analysis of branch performance, product lines, and customer behavior

CREATE TABLE sales(
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    VAT DECIMAL(6, 4) NOT NULL,                   
    total DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10, 2) NOT NULL,
    gross_margin_percentage DECIMAL(10, 9) NOT NULL, 
    gross_income DECIMAL(12, 4) NOT NULL,
    rating DECIMAL(3, 2) NOT NULL                   
);

