CREATE PROCEDURE dbo.product_procedure
@ProductID int,
@TotalAmount decimal (10,2)OUTPUT
as BEGIN
set NOCOUNT on;
    select 
        @TotalAmount= sum(UnitPrice * UnitinStock)
       
      
        from Product
      where ProductID=@ProductID
  return 0
end

declare @TotalAmount decimal(10,2);

exec dbo.product_procedure
  @ProductID = 1,
  @TotalAmount = @TotalAmount output;

select @TotalAmount as TotalAmount;

SELECT * from dbo.Customer