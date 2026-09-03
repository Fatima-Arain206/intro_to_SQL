-- procedure and parameters
create procedure dbo.Procedure_Para
@ProductID int
as 
begin
set nocount on;
	select 
	o.ProductID,
	o.Quantity,
	o.OrderDate,
	o.Sales
	from Sales.Orders as o
	where o.Sales > 10
	end;

	 exec dbo.Procedure_Para
		@ProductID = 102


		alter procedure dbo.Procedure_para
		@ProductID int
as 
begin
set nocount on;
	select 
	o.ProductID,
	o.Quantity,
	o.OrderDate,
	o.Sales
	from Sales.Orders as o
	where ProductID = @ProductID
	end;