# 📦 Order Items Analysis (Olist E-Commerce Dataset)

## 📌 Overview

This section of the project focuses on analyzing the **order items** data to understand sales performance, pricing trends, seller contributions, and shipping costs.

The `order_items` table is one of the most important tables in the dataset as it contains detailed information about each product sold within an order.

---

## 📊 Dataset Source

The dataset was obtained from Kaggle:

* **Dataset Name:** Brazilian E-Commerce Public Dataset by Olist
* **Source:** https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## 📁 Table: `order_items`

### 🔑 Key Columns:

* `order_id` – Unique identifier for each order
* `order_item_id` – Item number within the order
* `product_id` – Unique product identifier
* `seller_id` – Seller responsible for the item
* `shipping_limit_date` – Shipping deadline
* `price` – Price of the item
* `freight_value` – Shipping cost for the item

---

## 🧹 Data Preparation

The dataset was cleaned before analysis:

* Checked for missing values
* Verified data types (numeric, date, text)
* Ensured consistency in column naming
* Removed any duplicate records where necessary

---

## 📈 Key Analysis & Queries

### 1. Total Freight Cost

Calculated the total shipping cost across all orders:

```sql
SELECT SUM(freight_value) AS total_freight_cost
FROM order_items;
```

---

### 2. Total Number of Records

Counted all rows in the dataset:

```sql
SELECT COUNT(*) AS total_rows
FROM order_items;
```

---

### 3. Most Expensive Item

Identified the highest-priced item:

```sql
SELECT MAX(price) AS highest_price
FROM order_items;
```

---

### 4. Top 5 Sellers by Revenue

Ranked sellers based on total sales:

```sql
SELECT TOP 5
    seller_id,
    SUM(price) AS total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC;
```

---

### 5. Number of Unique Sellers

Determined how many sellers are in the dataset:

```sql
SELECT COUNT(DISTINCT seller_id) AS number_of_sellers
FROM order_items;
```

---

### 6. Average Freight Cost per Order

Calculated the average shipping cost per order:

```sql
SELECT AVG(order_freight) AS avg_freight_per_order
FROM (
    SELECT 
        order_id,
        SUM(freight_value) AS order_freight
    FROM order_items
    GROUP BY order_id
) AS freight_summary;
```

---

## 💡 Key Insights

* Freight costs contribute significantly to total order expenses
* Revenue is unevenly distributed among sellers (top sellers dominate)
* Some items have significantly higher prices, indicating product variation
* Shipping costs vary across orders, affecting overall customer spend

---

## 🛠 Tools Used

* SQL Server Management Studio (SSMS)
* Microsoft Excel
* GitHub

---

## 🚀 Project Value

This analysis demonstrates:

* Strong SQL aggregation skills
* Ability to derive business insights from transactional data
* Understanding of e-commerce metrics such as revenue and logistics cost


