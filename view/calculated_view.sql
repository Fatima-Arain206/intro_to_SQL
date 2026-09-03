-- calculated view
create view Sales.CalculatedView
as 
select 
o.OrderID,
o.Quantity,
o.OrderDate,
p.Price,
o.Quantity * p.Price as TotalBIll
from Sales.Orders as o
left join Sales.Products as p
on o.ProductID =p.ProductID