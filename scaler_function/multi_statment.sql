--Create multi-statement table-valued functions
--Multi-statement table-valued functions provide more flexibility when you need to perform multiple operations to build your result set.

--Consider a function that calculates product sales summaries with multiple aggregations:
CREATE FUNCTION dbo.GetProductSalesSummary
(
    @StartDate DATE,
    @EndDate DATE
)
RETURNS @SalesSummary TABLE
(
    ProductID INT,
    ProductName NVARCHAR(100),
    TotalQuantity INT,
    TotalRevenue DECIMAL(18,2),
    AveragePrice DECIMAL(18,2)
)
AS
BEGIN
    INSERT INTO @SalesSummary
    SELECT 
        p.ProductID,
        p.ProductName,
        SUM(od.Quantity) AS TotalQuantity,
        SUM(od.Quantity * od.UnitPrice) AS TotalRevenue,
        AVG(od.UnitPrice) AS AveragePrice
    FROM Production.Product p
    INNER JOIN dbo.OrderDetails od ON p.ProductID = od.ProductID
    INNER JOIN [Order] o ON od.OrderID = o.OrderID
    WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
    GROUP BY p.ProductID, p.ProductName;

    RETURN;
END;
