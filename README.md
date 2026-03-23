# 📊 Data-Driven SQL Project (P2 Database)

## 📌 Overview

This project is a **data-driven SQL database system** designed to simulate real-world business operations involving customers, orders, and employees.

It demonstrates how structured data can be used to perform **analysis, reporting, and decision-making** using SQL queries.

---

## 🎯 Objectives

* Design a relational database with proper structure
* Perform CRUD operations
* Apply SQL concepts like joins, subqueries, window functions, and case statements
* Generate insights from data

---

## 🗂️ Database Structure

### 🧑 Customers Table

Stores customer details:

* `customer_id` (Primary Key)
* `first_name`
* `last_name`
* `email`
* `registration_date`

---

### 🛒 Fields Table (Orders)

Stores order information:

* `order_id` (Primary Key)
* `customer_id` (Foreign Key)
* `orderDate`
* `total_amount`

---

### 👨‍💼 Employees Table

Stores employee data:

* `employee_id` (Primary Key)
* `firstname`
* `lastname`
* `department`
* `hire_date`
* `salary`

---

## 🔗 Relationships

* `fields.customer_id → customers.customer_id`

---

## ⚙️ Key Features

### ✅ CRUD Operations

* Insert, update, delete, and retrieve records

---

### 🔗 Joins

* INNER JOIN → Matching records
* LEFT JOIN → All customers + matching orders
* RIGHT JOIN → All orders + matching customers
* FULL OUTER JOIN (via UNION)

---

### 📊 Data Analysis

#### 🔹 Subqueries

* Customers with above-average order amount
* Employees with above-average salary

#### 🔹 Aggregations

* Average, max, min values
* Distinct filtering

---

### 📅 Date Functions

* Extract year and month
* Calculate date differences
* Format dates

---

### 🔤 String Functions

* CONCAT → Full name
* REPLACE → Modify text
* UPPER / LOWER → Case conversion
* TRIM → Remove spaces

---

### 📈 Window Functions (Advanced SQL)

* Running total of orders
* Ranking orders by amount

---

### 🧠 Business Logic (CASE)

* Discount calculation based on order value
* Employee salary categorization

---

## 📌 Sample Queries

### 🔸 Running Total

```sql
SELECT order_id, total_amount,
SUM(total_amount) OVER (ORDER BY order_id) AS running_total
FROM fields;
```

### 🔸 Rank Orders

```sql
SELECT order_id, total_amount,
RANK() OVER (ORDER BY total_amount DESC) AS Orderrank
FROM fields;
```

### 🔸 Discount Logic

```sql
SELECT order_id, total_amount,
CASE 
    WHEN total_amount > 1000 THEN '10% discount'
    WHEN total_amount > 500 THEN '5% discount'
    ELSE 'No discount'
END AS disco
```
