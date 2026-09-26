--Create a view that combines customers and their orders in AdventureWorksLT (SalesLT schema). This hides JOIN complexity from application code.
CREATE view view_order
as 
SELECT
O.OrderID,
O.OrderDate,
o.CustomerName,
TotalAmount,UnitPrice
from [Order] as O

inner join OrderDetails Od
on O.OrderID = od.OrderID


-- 
SELECT top(5) * from view_order

SELECT * from dbo.OrderDetails