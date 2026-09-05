/*
Create a view that combines customers and their orders in AdventureWorksLT (SalesLT schema). This hides JOIN complexity from application code.

Copy and paste the following T-SQL code into a new query window. Select Execute to create the view.
*/
--select * from Sales.Customers
--select * from Sales.Orders

-- 
create or alter view Sales.vCustomerOrders
as 
	select
		c.CustomerID,
		concat(c.FirstName+' ',+c.LastName) as CustomerFullName,
		o.SalesPersonID,
		o.OrderDate

		from Sales.Customers c
		inner join Sales.Orders o
		on c.CustomerID=  o.OrderID
		-- verify this view
		select   * from Sales.vCustomerOrders 

		SELECT TOP (5) * 
 FROM Sales.vCustomerOrders 
 ORDER BY OrderDate DESC;