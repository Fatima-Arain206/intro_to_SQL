SELECT 
    p.ProductID,
   -- p.Name,
    p.ListPrice
    --pc.Name AS Category
FROM dbo.Products AS p
INNER JOIN dbo.ProductCategories AS pc
    ON p.ProductCategoryID = pc.ProductCategoryID
WHERE p.ListPrice > (
    SELECT AVG(p2.ListPrice)
    FROM dbo.Products AS p2
    WHERE p2.ProductCategoryID = p.ProductCategoryID
)
ORDER BY  p.ListPrice DESC;