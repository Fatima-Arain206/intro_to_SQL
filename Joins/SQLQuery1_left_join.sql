-- left join
--this type gonna retrun all rows from left table and only matcing from right
use MyDatabase
--select * from customers
--select * from orders

select c.first_name,
c.country,
o.sales,o.order_id
 from customers as c
left join orders as o
on c.id = o.customer_id
