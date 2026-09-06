--PERCENT_RANK() and CUME_DIST() calculate relative position within a partition:

SELECT 
    Product,
    Price,
    PERCENT_RANK() OVER (ORDER BY Price) AS PercentRank,
    CUME_DIST() OVER (ORDER BY Price) AS CumulativeDistribution
FROM Sales.Products
WHERE Price > 0
ORDER BY Price;