-- get all customers along with orders , but only  for customers who has placesan order
-- without using inner join
select *
from customers 
select *
from orders

select * from
customers as c
left join orders as o
on c.id = o.customer_id

where  c.id = o.customer_id

--

select *
from orders

select * from
customers as c
left join orders as o
on o.customer_id  = c.id
where o.customer_id is not null