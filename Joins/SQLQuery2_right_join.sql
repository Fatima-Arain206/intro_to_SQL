--right join
-- this type gonna returns all data from right table and only matcing rows from left
select 
	c.first_name,
	c.country,
	o.customer_id,
	o.sales



from customers as c
right join orders as o

on o.customer_id = c.id