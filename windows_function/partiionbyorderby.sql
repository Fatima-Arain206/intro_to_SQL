use SalesDB
select 
--o.CustomerID,
o.ProductID,
o.OrderDate,
sum(o.Quantity) over(partition by productID order by o.OrderDate) as total_count--
-- coutnts how many products sold by product id
from Sales.Orders o
order by o.ProductID desc
/*When you specify ORDER BY in the OVER clause without a frame specification, the default frame is RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW for aggregate functions. This creates cumulative calculations.


*/
