-- Find product pairs with similar names
SELECT 
    p1.ProductID AS Product1ID,
    p1.Product AS Product1Name,
    p2.ProductID AS Product2ID,
    p2.Product AS Product2Name,
    EDIT_DISTANCE(p1.Product, p2.Product) AS EditDistance
FROM Sales.Products AS p1
INNER JOIN Sales.Products AS p2
    ON p1.ProductID < p2.ProductID
WHERE EDIT_DISTANCE(p1.Product, p2.Product) <= 5
ORDER BY EDIT_DISTANCE(p1.Name, p2.Name);