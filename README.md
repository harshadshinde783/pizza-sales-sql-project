# 🍕 Pizza Sales SQL Analysis (MySQL Project)

This project contains a complete SQL-based analysis of a pizza sales database.  
It includes database schema creation, CSV data import, and advanced SQL queries to generate meaningful business insights.

---

## 📂 Project Structure

project/
│
├── pizza_sales_queries.sql        # Main SQL analysis file
│
└── database/
       ├── schemas.sql             # CREATE TABLE scripts
       └── data/                   # Raw CSV dataset
             ├── orders.csv
             ├── order_details.csv
             ├── pizzas.csv
             └── pizza_types.csv

---

## 🗄️ Database Description

The project contains **four tables**:

### 1. orders
- order_id  
- order_date  
- order_time  

### 2. order_details
- order_details_id  
- order_id  
- pizza_id  
- quantity  

### 3. pizzas
- pizza_id  
- pizza_type_id  
- size  
- price  

### 4. pizza_types
- pizza_type_id  
- name  
- category  
- ingredients  

---

## 🛠️ How to Set Up

### 1️⃣ Create Database Schema
Run this file in MySQL:

```
SOURCE database/schemas.sql;
```

---

### 2️⃣ Import CSV Data

#### Method 1: MySQL Workbench
- Right-click each table → Table Data Import Wizard → Select CSV

#### Method 2: SQL Command

```
LOAD DATA INFILE 'orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

Repeat for all CSV files.

---

## 📊 Analysis Performed

The file `pizza_sales_queries.sql` includes:

### ✔ Sales KPIs
- Total revenue  
- Total pizzas sold  
- Total orders  
- Average order value  

### ✔ Trend Analysis
- Daily revenue  
- Monthly revenue  
- Order count trends  

### ✔ Pizza Performance
- Top 3 pizzas by revenue  
- Best/worst-selling pizzas  
- Revenue by category  
- Quantity sold per pizza  

### ✔ CTE Queries
- Category-wise revenue  
- Percentage contribution of each pizza  

### ✔ Window Functions
- Cumulative revenue  
- Ranking pizzas by sales  
- Running totals  

### ✔ Time Slot Analysis
- Morning  
- Afternoon  
- Evening  
- Night  

---

## 📈 Sample Insights
- Which pizza generates the most revenue?  
- Which pizza size sells the most?  
- What time of day has the most orders?  
- Daily revenue growth patterns  
- Top revenue-generating pizza categories  

---

## 🛠️ Tools Used
- MySQL  
- CSV Dataset  
- GitHub  

---

## 👤 Author
**Harshad Shinde**  
