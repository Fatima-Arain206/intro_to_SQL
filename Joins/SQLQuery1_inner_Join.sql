-- inner joins -- basics
-- this join type will gonna return only the matching rows
-- from both tables
-- we will get only matching data  from A only  if exists in b
-- * only common data

/* select * from A 
[type] join B  
on A.key = B.key

on < common col >
defualt type is inner join
*/
-- task 
-- get all customers along with thier orders,only for customers who have placed order

select * from 
customers
inner join orders
on customers.id = orders.customer_id

-- change
select
	customers.id, customers.first_name,
	orders.sales, orders.order_id
from customers
inner join orders
on customers.id = orders.customer_id