-- Assuming Orders table has a JSON column called OrderDetails
SELECT 
    o.OrderID,
    o.CustomerID,
    items.ProductName,
    items.Quantity,
    items.UnitPrice
FROM Sales.Products AS o
CROSS APPLY OPENJSON(o.OrderID)
WITH (
    ProductName NVARCHAR(100) '$.product',
    Quantity INT '$.qty',
    UnitPrice DECIMAL(10,2) '$.price'
) AS items;