-- This script is for creating a new table called "customers" in the "online_store" database.
CREATE DATABASE online_store;
USE online_store;
-- The table will have the following columns:
--  - "id": a unique identifier for each customer, set as the primary key
--  - "name": the customer's name
--  - "email": the customer's email address
--  - "password": the customer's password, stored as a hash for security
--  - "created_at": a timestamp for when the customer's account was created

CREATE TABLE online_store.customers (
  id INT NOT NULL AUTO_INCREMENT, -- AUTO_INCREMENT ensures that each new row gets a unique id
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password CHAR(64) NOT NULL, -- Use a fixed length to store the hash
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Default value is the current timestamp
  PRIMARY KEY (id)
);

-- Now let's add a few customers to the table

INSERT INTO online_store.customers (name, email, password)
VALUES
  ("John Smith", "john@example.com", SHA2("mypassword", 256)), -- Using SHA2 function to hash the password
  ("Jane Doe", "jane@example.com", SHA2("janespassword", 256)),
  ("Bob Johnson", "bob@example.com", SHA2("bobspassword", 256));

-- Now let's create a table for products
-- The table will have the following columns:
--  - "id": a unique identifier for each product, set as the primary key
--  - "name": the name of the product
--  - "description": a description of the product
--  - "price": the price of the product
--  - "quantity": the number of units of the product in stock

CREATE TABLE online_store.products (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL, -- 10 digits, 2 of which are decimals
  quantity INT NOT NULL,
  PRIMARY KEY (id)
);

-- Now let's add some products to the table

INSERT INTO online_store.products (name, description, price, quantity)
VALUES
  ("T-Shirt", "A stylish t-shirt made of 100% cotton", 19.99, 100),
  ("Jeans", "A pair of classic blue jeans", 39.99, 50),
  ("Jacket", "A warm and durable jacket", 99.99, 25),
  ("Hat", "A fashionable hat to keep you warm in the winter", 14.99, 75);


-- This script is for creating a new table called "orders" in the "online_store" database.
-- The table will have the following columns:
--  - "id": a unique identifier for each order, set as the primary key
--  - "customer_id": a foreign key referencing the "id" column in the "customers" table
--  - "total_cost": the total cost of the order
--  - "status": the status of the order (e.g. "pending", "shipped", "cancelled")
--  - "created_at": a timestamp for when the order was placed

CREATE TABLE online_store.orders (
  id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  total_cost DECIMAL(10,2) NOT NULL,
  status VARCHAR(255) NOT NULL DEFAULT "pending", -- Default value is "pending"
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES online_store.customers(id)
);

-- Now let's add some orders to the table

INSERT INTO online_store.orders (customer_id, total_cost, status)
VALUES
  (1, 59.98, "pending"), -- John Smith places an order for $59.98
  (2, 149.97, "shipped"), -- Jane Doe places an order for $149.97 and it gets shipped
  (3, 0, "cancelled"); -- Bob Johnson places an order but then cancels it, so the total cost is $0

