create database pizzahut;

use pizzahut;




CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_time TIME
);


CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    ingredients TEXT
);


CREATE TABLE pizzas (
    pizza_id VARCHAR(50) PRIMARY KEY,
    pizza_type_id VARCHAR(50),
    size VARCHAR(5),
    price DECIMAL(10,2)
);


CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id VARCHAR(50),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)

);


select * from orders;
select * from pizza_types;
select * from pizzas;
select * from order_details;