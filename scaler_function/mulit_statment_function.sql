alter FUNCTION dbo.GetProductSalesSummary
(
    --@StartDate DATE,
    --@EndDate DATE
)
RETURNS @SalesSummary TABLE
(
    ProductID INT,
    ProductName NVARCHAR(100),
    TotalQuantity INT,
    TotalRevenue DECIMAL(18,2)
)
AS
BEGIN
    INSERT INTO @SalesSummary
    SELECT 
        p.ProductID,
        p.Product,
        SUM(od.Quantity) AS TotalQuantity,
        SUM(od.Quantity * o.Sales) AS TotalRevenue
    FROM Sales.Products p
    INNER JOIN Sales.OrdersArchive od ON p.ProductID = od.ProductID
    INNER JOIN Sales.Orders o ON od.OrderID = o.OrderID
    --WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
    GROUP BY p.ProductID, p.Product;

    RETURN;
END;

--
select * from dbo.GetProductSalesSummary();