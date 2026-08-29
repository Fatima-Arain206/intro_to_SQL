-- anti left join
-- return those rows from left table which has no match with right table
-- see those customers who did not make any order
select * 
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is null

-- anit right join
-- return those rows from right table that has  no match with left table

-- get all orders without matching customers
select * 
from customers
right join orders
on customers.id = orders.customer_id
where customers.id  is null
--
-- get those order that has no match with customers
select * from orders as o
left join  customers as c
on o.customer_id = c.id
where c.id is null


select 
* from orders