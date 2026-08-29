-- full join
select * from 
customers as c
full join orders as o
on c.id = o.customer_id
