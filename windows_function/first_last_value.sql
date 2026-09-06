--FIRST_VALUE() and LAST_VALUE() return values from the first or last row in the frame:

SELECT 
    ProductID,
    Product,
    Price,
    Category,
    FIRST_VALUE(PRODUCT) OVER (
        PARTITION BY Category 
        ORDER BY Price DESC
    ) AS MostExpensiveInCategory,
    LAST_VALUE(Product) OVER (
        PARTITION BY Category 
        ORDER BY Price DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LeastExpensiveInCategory
FROM Sales.Products
WHERE Price > 0;