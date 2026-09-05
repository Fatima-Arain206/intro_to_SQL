/*Build a TVF to return orders for a given customer from AdventureWorksLT. TVFs are handy in SELECT and JOIN clauses.

Copy and paste the following T-SQL code into a new query window. Select Execute to create the TVF.*/
create or alter  function Sales.GetCustomerOrders (@CustomerID int)

returns table
as return
(
select
o.SalesPersonID,
o.Sales
from Sales.Orders o
where CustomerID = @CustomerID
);


--

select * 
from Sales.GetCustomerOrders(1)