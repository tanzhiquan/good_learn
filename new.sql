---

```markdown
# MySQL 连接查询练习题

本练习题基于《MySQL必知必会》数据集，涵盖了 MySQL 中的所有连接查询知识点，包括：内连接、左连接、右连接、全连接、自连接、交叉连接等。每题都包含表结构、初始化数据和解答，帮助理解和应用不同的连接方式。

## 数据集

### 1. 表结构和初始化数据
-- 创建数据库
CREATE DATABASE IF NOT EXISTS mysql_practice;

-- 使用新创建的数据库
USE mysql_practice;


```sql
-- 创建 customers 表
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- 插入 customers 表数据
INSERT INTO customers (customer_id, name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com'),
(4, 'David', 'david@example.com');

-- 创建 orders 表
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 插入 orders 表数据
INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1, 1, '2023-10-01'),
(2, 1, '2023-10-05'),
(3, 2, '2023-10-07'),
(4, 3, '2023-10-10');

-- 创建 products 表
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- 插入 products 表数据
INSERT INTO products (product_id, name, price) VALUES
(1, 'Product A', 100.00),
(2, 'Product B', 150.00),
(3, 'Product C', 200.00);

-- 创建 order_items 表
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 插入 order_items 表数据
INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 1, 1),
(4, 3, 3, 1),
(5, 4, 2, 3);
```


  
  ### 1. 内连接
  **题目**：查询每个订单的客户名称和下单日期。

  ### 2. 左连接
  **题目**：查询所有客户的名称和他们的订单日期，如果没有订单则显示 NULL。

  ### 3. 右连接
  **题目**：查询所有订单的客户名称和订单日期，如果客户信息缺失则显示 NULL。

  ### 4. 全连接
  **题目**：查询所有客户和订单的名称和日期，包括没有匹配的记录。

  ### 5. 自连接
  **题目**：查询与自己同名的客户信息。

  ### 6. 交叉连接
  **题目**：查询所有客户和所有产品的笛卡尔积。

  ### 7. 复合查询
  **题目**：查询每个客户的订单总金额。

  ### 8. 子查询结合连接查询
  **题目**：查询购买总量超过 3 件的客户名称和总购买量。

  ### 9. 自然连接
  **题目**：使用自然连接查询每个订单的详细商品信息，包括客户名称、下单日期、商品名称和数量。



















































---

## 练习题-答案

### 1. 内连接（INNER JOIN）
**题目**：查询每个订单的客户名称和下单日期。
- **SQL**：
  ```sql
  SELECT o.order_id, c.name AS customer_name, o.order_date
  FROM orders o
  INNER JOIN customers c ON o.customer_id = c.customer_id;
  ```
- **答案**：
  | order_id | customer_name | order_date |
  |----------|---------------|------------|
  | 1        | Alice         | 2023-10-01 |
  | 2        | Alice         | 2023-10-05 |
  | 3        | Bob           | 2023-10-07 |
  | 4        | Charlie       | 2023-10-10 |

### 2. 左连接（LEFT JOIN）
**题目**：查询所有客户及其订单情况，包括无订单的客户。
- **SQL**：
  ```sql
  SELECT c.name AS customer_name, o.order_date
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id;
  ```
- **答案**：
  | customer_name | order_date  |
  |---------------|-------------|
  | Alice         | 2023-10-01  |
  | Alice         | 2023-10-05  |
  | Bob           | 2023-10-07  |
  | Charlie       | 2023-10-10  |
  | David         | NULL        |

### 3. 右连接（RIGHT JOIN）
**题目**：查询所有订单及其客户情况，包括无客户的订单。
- **SQL**：
  ```sql
  SELECT o.order_id, c.name AS customer_name
  FROM orders o
  RIGHT JOIN customers c ON o.customer_id = c.customer_id;
  ```
- **答案**：
  | order_id | customer_name |
  |----------|---------------|
  | 1        | Alice         |
  | 2        | Alice         |
  | 3        | Bob           |
  | 4        | Charlie       |
  | NULL     | David         |

### 4. 自连接（SELF JOIN）
**题目**：查询与其他客户同名的客户对。
- **SQL**：
  ```sql
  SELECT a.customer_id AS customer_1, b.customer_id AS customer_2, a.name
  FROM customers a
  JOIN customers b ON a.name = b.name AND a.customer_id < b.customer_id;
  ```
- **答案**：
  *没有符合条件的结果*。

### 5. 交叉连接（CROSS JOIN）
**题目**：列出所有客户与商品的组合。
- **SQL**：
  ```sql
  SELECT c.name AS customer_name, p.name AS product_name
  FROM customers c
  CROSS JOIN products p;
  ```
- **答案**（示例部分数据）：
  | customer_name | product_name |
  |---------------|--------------|
  | Alice         | Product A    |
  | Alice         | Product B    |
  | Alice         | Product C    |
  | Bob           | Product A    |

### 6. 全连接（FULL OUTER JOIN）
**题目**：查询所有客户及其订单情况，包括无订单的客户和无客户信息的订单。
- **SQL**（MySQL 不支持 `FULL JOIN`，可以使用 `UNION` 实现）：
  ```sql
  SELECT c.name AS customer_name, o.order_date
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
  UNION
  SELECT c.name, o.order_date
  FROM orders o
  RIGHT JOIN customers c ON o.customer_id = c.customer_id;
  ```
- **答案**：
  | customer_name | order_date  |
  |---------------|-------------|
  | Alice         | 2023-10-01  |
  | Alice         | 2023-10-05  |
  | Bob           | 2023-10-07  |
  | Charlie       | 2023-10-10  |
  | David         | NULL        |

### 7. 多表连接查询
**题目**：查询每个订单的详细商品信息，包括客户名称、下单日期、商品名称和数量。
- **SQL**：
  ```sql
  SELECT c.name AS customer_name, o.order_date, p.name AS product_name, oi.quantity
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id;
  ```
- **答案**：
  | customer_name | order_date  | product_name | quantity |
  |---------------|-------------|--------------|----------|
  | Alice         | 2023-10-01  | Product A    | 2        |
  | Alice         | 2023-10-01  | Product B    | 1        |
  | Alice         | 2023-10-05  | Product A    | 1        |
  | Bob           | 2023-10-07  | Product C    | 1        |

### 8. 子查询结合连接查询
**题目**：查询购买总量超过 3 件的客户名称和总购买量。
- **SQL**：
  ```sql
  SELECT c.name, customer_orders.total_quantity
  FROM customers c
  JOIN (
    SELECT o.customer_id, SUM(oi.quantity) AS total_quantity
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
  ) AS customer_orders ON c.customer_id = customer_orders.customer_id
  WHERE customer_orders.total_quantity > 3;
  ```
- **答案**：
  | name  | total_quantity |
  |-------|----------------|
  | Alice | 4              |
  | Bob   | 3              |

---


### 9. 自然连接
**题目**：使用自然连接查询每个订单的详细商品信息，包括客户名称、下单日期、商品名称和数量。
- **SQL**：
  ```sql
  SELECT c.name AS customer_name, o.order_date, p.name AS product_name, oi.quantity
  FROM customers c
  NATURAL JOIN orders o
  NATURAL JOIN order_items oi
  NATURAL JOIN products p;
  ```
- **答案**：
  | customer_name | order_date  | product_name | quantity |
  |---------------|-------------|--------------|----------|
  | Alice         | 2023-10-01  | Product A    | 2        |
  | Alice         | 2023-10-01  | Product B    | 1        |
  | Alice         | 2023-10-05  | Product A    | 1        |
  | Bob           | 2023-10-07  | Product C    | 1        |
