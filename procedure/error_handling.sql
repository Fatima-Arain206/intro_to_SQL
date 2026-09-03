-- check
exec dbo.insertOrders
	@OrderID =3,
	@OrderDate='2026-09-04',
	@CustomerID = 102,
	@Amount =1200
select * from dbo.Orders