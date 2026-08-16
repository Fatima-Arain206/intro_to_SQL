select * from
customers as c
left join orders as o
on c.id = o.customer_id
--where o.sales > 10

-- get all customers  along thier order
--including orders without matching customers

select * from
orders
left join customers
on orders.customer_id = customers.id