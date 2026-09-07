-- Non-correlated subquery (executes once)
SELECT ProductID, Name, ListPrice
FROM dbo.Products
WHERE ListPrice > (SELECT AVG(ListPrice) FROM dbo.Products);

-- Correlated subquery (executes per outer row)
SELECT p1.ProductID, p1.Name, p1.ListPrice
FROM dbo.Products AS p1
WHERE p1.ListPrice > (
    SELECT AVG(p2.ListPrice)
    FROM dbo.Products AS p2
    WHERE p2.ProductCategoryID = p1.ProductCategoryID  -- References outer query
);
/*n the noncorrelated example, the subquery calculates a single average price across all products. This value is computed once, and then each product's price is compared against that fixed number.

In the correlated example, the subquery references p1.ProductCategoryID from the outer query. This creates a dependency: for each product row, the subquery calculates the average price for that specific category. A product in the "Bikes" category is compared against the bikes average, while a product in "Accessories" is compared against the accessories average.