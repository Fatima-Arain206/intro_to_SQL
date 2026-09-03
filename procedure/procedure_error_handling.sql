-- 
--use minilab
--update ordera from orders
create procedure dbo.UpdateOrders
@OrderID int,
@OrderDate date,
@CustomerID int,
@Amount int
as 
begin -- procedure
	set nocount on
	-- begin try 
	begin try
		-- transaction
		begin transaction
		
		if not exists(
			select 1
			from dbo.Orders
			where OrderID = @OrderID
		)
		begin
			raiserror('Order id does not exist ',16,1)
		end
		
		update dbo.Orders
		set CustomerID =@CustomerID ,
			OrderDate = @OrderDate,
			Amount = @Amount
		where OrderID = @OrderID
		
		commit transaction
		return 0;
	end try
	
	begin catch
		if @@trancount >0
			rollback transaction

		declare @errorMessage NVARCHAR(100) = ERROR_MESSAGE()
		DECLARE @SEVERITY INT = ERROR_SEVERITY()
		DECLARE @STATE_ERROR INT = ERROR_STATE()

		begin
			RAISERROR(@errorMessage,@SEVERITY,@STATE_ERROR)
		end
		return -1
	end catch
	end -- procedure


	--
	exec dbo.UpdateOrders
	@OrderID =3,
	@OrderDate = '2026-09-04',
	@Amount=2300,
	@CustomerID=103

	select * from dbo.Orders
	

		

