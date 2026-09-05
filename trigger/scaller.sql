--procedure
-- scaler function
--eate a scalar function that returns the total value of an order using AdventureWorksLT line totals.


create or alter function Sales.fnOrderTotal 
(@OrderID int)
returns decimal(10,2)
as begin
	declare @totalSum decimal(10,2)
	select @totalSum = o.Sales
	from Sales.Orders o
	where o.OrderID = @OrderID
	return @totalSum
	end

	select 
	o.Sales,
	o.CustomerID,
	Sales.fnOrderTotal() as totalSum
	from
	Sales.Orders o