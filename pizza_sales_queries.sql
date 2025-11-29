-- Basic:

-- total number of orders placed.

select * from orders;

select count(order_id) as total_order_place from orders;




--  total revenue generated from pizza sales.

select * from  order_details;
select * from pizzas;

select round(sum(od.quantity * p.price),2) as total_revenue from order_details od 
join pizzas p 
on p.pizza_id = od.pizza_id;




-- highest-priced pizza.

select * from pizzas;

select pizza_id, max(price) as highest_price from pizzas
group by pizza_id
order by highest_price desc
limit 1;




--  the most common pizza size ordered.

select * from pizzas;
select * from order_details;

select p.size,count(od.order_details_id) as total_order 
from pizzas p 
join order_details od 
on od.pizza_id = p.pizza_id 
group by p.size
order by total_order desc
limit 1;




--  top 5 most ordered pizza types along with their quantities.

select * from order_details;
select * from pizzas;
select * from pizza_types;

select pt.name,sum(od.quantity) as total_quantity_order from order_details od 
join pizzas p 
on p.pizza_id = od.pizza_id 
join pizza_types pt 
on pt.pizza_type_id = p.pizza_type_id
group by pt.name
order by total_quantity_order desc 
limit 5;




--  total quantity of each pizza category ordered.

select * from pizza_types;
select * from pizzas;
select * from order_details;

select pt.category,sum(od.quantity) as total_quantity from pizza_types pt
 join pizzas p 
 on p.pizza_type_id = pt.pizza_type_id 
 join order_details od 
 on od.pizza_id = p.pizza_id
 group by pt.category
 order by total_quantity desc;
 
 
 
 
 
 
 -- Intermediate:
 
--  distribution of orders by hour of the day.

select * from orders;

select hour(order_time) as hour , count(*) as total_order_distrubution from orders 
group by hour  
order by hour;




--   average number of pizzas ordered per day.

select * from orders;
select * from order_details;

select round(avg(total_quantity),2) from (
select o.order_date ,sum(od.quantity) as total_quantity 
from orders o 
join order_details od 
on o.order_id = od.order_id
group by o.order_date) as per_day;




-- top 3 most ordered pizza types based on revenue.

select * from pizza_types;
select * from order_details;
select * from pizzas;

with pizza_type_revenue as ( 
select pt.name, sum(od.quantity*p.price) as total_revenue from pizza_types pt 
join pizzas p 
on p.pizza_type_id = pt.pizza_type_id 
join order_details od 
on od.pizza_id = p.pizza_id
group by pt.name)

select name,total_revenue 
from pizza_type_revenue 
order by total_revenue desc 
limit 3;




-- Categorize each order into time slots using CASE Breakfast (6–10 AM)breakfast (11–15 PM)lunch (16-19 PM)evening (20-23 pm)night)

select * from orders;

SELECT CASE WHEN HOUR(order_time) BETWEEN 6 AND 10 THEN 'Breakfast'
            WHEN HOUR(order_time) BETWEEN 11 AND 15 THEN 'Lunch'
			WHEN HOUR(order_time) BETWEEN 16 AND 19 THEN 'Evening'
            WHEN HOUR(order_time) BETWEEN 20 AND 23 THEN 'Night'
            ELSE 'Late Night'
            END AS time_slot,
		    COUNT(*) AS total_orders
FROM orders
GROUP BY time_slot
ORDER BY total_orders DESC;

 



-- Advanced:

-- Calculate the percentage contribution of each pizza type to total revenue.

select * from pizza_types;
select * from order_details;
select * from pizzas;


select pt.category,sum(od.quantity * p.price )  as revenue,sum(od.quantity * p.price ) *100/(select sum(od.quantity * p.price ) 
from order_details od
join pizzas p  on p.pizza_id = od.pizza_id) as percentage from order_details od 
join pizzas p 
on p.pizza_id = od.pizza_id 
join pizza_types pt 
on pt.pizza_type_id = p.pizza_type_id
group by pt.category
order by percentage desc;





-- Analyze the cumulative revenue generated over time.

select * from orders;
select * from pizzas;
select * from order_details;

select order_date,revenue,sum(revenue) over (order by order_date ) as cumuliti from  (select o.order_date,sum(od.quantity * p.price) as revenue 
from orders o
join order_details od 
on o.order_id = od.order_id 
join pizzas p 
on p.pizza_id = od.pizza_id
group by o.order_date) as sales;
 
 
 


-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select * from pizza_types;
select * from order_details;
select * from pizzas;

select name, category,revenue,ranking from (
select pt.name,pt.category,sum(od.quantity*p.price) as revenue ,rank() over (partition by category order by sum(od.quantity*p.price) desc) as ranking
from  pizza_types pt 
join pizzas p 
on p.pizza_type_id = pt.pizza_type_id 
join order_details od 
on od.pizza_id = p.pizza_id
group by pt.name,pt.category) t
where ranking <= 3
order by category, revenue desc;











