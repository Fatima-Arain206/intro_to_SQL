/*
Apply aggregate window functions
Standard aggregate functions like SUM, AVG, COUNT, MIN, and MAX can be used as window functions by adding the OVER clause. This allows you to calculate aggregates while retaining individual row details.

The following query demonstrates how to calculate running totals and cumulative aggregates:
*/
select 
o.CustomerID,
o.OrderDate,o.OrderStatus,
sum(o.Sales) over(order by o.CustomerID , o.OrderDate) as total_s,
avg(o.Quantity)over(order by o.CustomerID,o.OrderDate) as avg_q,
count(*) over(order by o.CustomerID,o.OrderDate) as total_num

from Sales.Orders o