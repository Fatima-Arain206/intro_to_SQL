-- IN memory table
CREATE TABLE dbo.OrderCache(
OrderID int primary key Nonclustered,
CustomerID int,
OrderDate datetime2,
Amount Decimal(10,2),
Index IX_OrderCahce_CustomerID nonclustered(  CustomerID)
) with (MEMORY_OPTIMIZED = ON,DURABILITY =SCHEMA_AND_DATA);
