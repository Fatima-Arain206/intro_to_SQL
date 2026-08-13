-- inner join
use MyDatabase

 SELECT 
 c.first_name , c.id
 ,c.country,
 o.order_date,o.sales

 from customers as c
 INNER JOIN orders as o
 on c.id = o.customer_id

