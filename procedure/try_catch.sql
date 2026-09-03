-- error handling
alter procedure dbo.insertOrders
--create procedure dbo.insertOrders
@OrderID int,
@CustomerID int,
@OrderDate Date,
@Amount decimal(10,2)
as
begin -- begin procedure
	set nocount on
		-- begin try
		begin try
			begin transaction --for roll back


			        -- Validate customer exists

				IF  EXISTS
					( SELECT 1
					FROM dbo.Orders
					where CustomerID = @CustomerID)-- if value already does  exist in table raise error


				BEGIN-- raise
					 RAISERROR('Customer  already exist.', 16, 1);
				END -- raise
		-- insert 
		-- else part of if ,if value does not exist insert 
			insert into dbo.Orders(OrderID,OrderDate,CustomerID,Amount)
			values(@OrderID,@OrderDate,@CustomerID,@Amount)
			commit transaction
			return 0

		end try -- end try

		begin catch
			if @@TRANCOUNT > 0
				rollback Transaction

			 DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
			DECLARE @ErrorSeverity int = ERROR_SEVERITY();
			DECLARE @ErrorState int = ERROR_STATE();

			RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        RETURN -1;
    END CATCH --end catch
END -- end procedure