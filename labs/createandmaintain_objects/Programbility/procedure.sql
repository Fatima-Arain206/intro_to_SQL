CREATE OR ALTER PROCEDURE dbo.AddOrderLineItem
@OrderID int,
@ProductID int,
@Quantity int

as 
BEGIN
    set NOCOUNT OFF
    BEGIN TRANSACTION
         declare @ProductPrice  decimal(10,2),
             @OrderDate date
         select @ProductPrice = cast(UnitPrice as decimal(10,2)  )

         from Product
         where ProductID = @ProductID

         if @ProductPrice is NULL
            BEGIN
            ROLLBACK TRANSACTION;
                THROW 50010, 'invalid ProductID', 1;
            END

            	-- Ensure SalesOrderID exists
            IF NOT EXISTS(SELECT 1 FROM [Order] WHERE OrderID=@OrderID)
            BEGIN
            ROLLBACK TRANSACTION;
            		THROW 50011, 'Invalid SalesOrderID specified.', 1;
            END

            SELECT @OrderDate = OrderDate
            FROM [Order]
            WHERE OrderID = @OrderID;

            insert into OrderDetails(OrderID,OrderDate,ProductID,Quantity,UnitPrice)
            VALUES(@OrderID,@OrderDate,@ProductID,@Quantity,@ProductPrice)

            update o
            set TotalAmount = d.Total
            from [Order] O 
            INNER JOIN(
                select 
                OrderID,
                sum(LineTotal) as Total
                from OrderDetails 
                where OrderID =@OrderID
                GROUP by OrderID 
            ) d
            on o.OrderID= d.OrderID
            COMMIT TRANSACTION
    END
GO


exec dbo.AddOrderLineItem
@ProductID =1,
@OrderID=1,
@Quantity =4


 -- Add a line item to an existing order (choose a valid SalesOrderID)
 DECLARE @ExistingOrderID BIGINT = (SELECT TOP 1 OrderID 
                             FROM dbo.OrderDetails 
                             ORDER BY OrderID DESC);
 EXEC dbo.AddOrderLineItem @OrderID = @ExistingOrderID,         
                             @ProductID = 2, 
                             @Quantity = 1; -- adjust ProductID as needed
    
 SELECT TOP (5) * 
 FROM dbo.OrderDetails 
 WHERE OrderID = @ExistingOrderID 
 ORDER BY OrderID DESC;
