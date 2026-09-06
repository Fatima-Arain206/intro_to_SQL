-- 'i' flag enables case-insensitive matching
SELECT Product
FROM Sales.Products
WHERE REGEXP_LIKE(Product, 'frame', 'c') ;