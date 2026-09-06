--
SELECT 
    p.ProductID,
    p.Product,
    p.Price,
    p.Category
    --pc.Name AS CategoryName
FROM Sales.Products AS p

WHERE Price > 100
FOR JSON auto-- ROOT('products');