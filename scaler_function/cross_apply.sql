-- create a func
create function getOrdersSaleSummary
(
@StartDate date
)
returns  @SummaryTable Table(
	ProductID int,
	ProductName varchar(100),
	TotalQuantity int,
	TotalSales int
	)
	as 
	begin 
		insert into @SummaryTable
		Select 
			p.ProductID,
			p.Product,
			sum(o.Quantity) as TotalQuantity,
			sum(o.Sales)
		from Sales.Orders o
		inner join Sales.Products p
		on o.ProductID = p.ProductID
		where o.OrderDate > @StartDate
		group by p.Product,p.ProductID
		
		return;
end

-- verify

select * from Sales.getOrdersSaleSummary('2025-01-01')
select * from getOrdersSaleSummary('2025-01-01')
cross 
	

	select *
	from Sales.OrderSummary
	select * from Sales.GetFunctionOrders(2)

	--  cross apply 
	select 
	o.CustomerID,
	o.OrderDate,
	o.Quantity
	from Sales.Orders o
	cross apply Sales.GetFunctionOrders(o.CustomerID)


	select
	*
	from Sales.Orders o
	cross apply getOrdersSaleSummary(o.OrderDate)

	select * from getOrdersSaleSummary('2025-01-01')
