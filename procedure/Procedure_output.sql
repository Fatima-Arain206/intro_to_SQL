-- procedure output
create procedure Sales.Sales_output
@OrderID int,
@TotalSales bigint output
as 
begin
	set nocount on
	select
	sum(Sales) as TotalSal
	
	from Sales.Orders
	return 0;
	end;


	-- find the total sales
	declare @totalSale int;
	exec Sales.Sales_output
	@OrderID=null,
	@TotalSales= @totalSale output

	select @totalSale
