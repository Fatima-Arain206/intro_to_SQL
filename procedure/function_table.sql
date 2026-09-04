-- inline table funtio
alter function Sales.GetFunctionOrders
(
@CustomerID int
)
returns table
return(
select
o.OrderID,o.OrderDate,o.CustomerID,o.Quantity,o.Sales

from Sales.Orders as o

where o.CustomerID = @CustomerID
);

-- use this function just like a table
select o.OrderID,o.OrderDate,o.CustomerID,o.Quantity,o.Sales
from Sales.GetFunctionOrders(2) as o

-- 
select * from Sales.GetFunctionOrders(3)