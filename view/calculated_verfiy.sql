-- verfiy
select
* from Sales.CalculatedView
--
select Price,Quantity,TotalBill from Sales.CalculatedView

select
Quantity,Price,TotalBill 
from Sales.CalculatedView 
where Quantity >2
