-- Update using a CTE to identify target rows
WITH DiscontinuedProducts AS
(
    SELECT ProductID
    FROM Sales.ProductsUpdateHistory E
    WHERE E.ChangeDate < DATEADD(YEAR, -2, GETDATE())
        AND ProductID NOT IN (
            SELECT DISTINCT ProductID 
            FROM Sales.OrdersArchive
            WHERE ChangeDate > DATEADD(YEAR, -1, GETDATE())
        )
)
UPDATE Sales.ProductsUpdateHistory
SET ChangeDate = GETDATE()
WHERE ProductID IN (SELECT ProductID FROM DiscontinuedProducts);
SELECT * FROM DiscontinuedProducts

/* This query uses a CTE to identify products that should be marked as discontinued. The CTE finds products where the sold end date is more than two years ago and that haven't appeared in any order details modified within the last year. The UPDATE statement then sets the DiscontinuedDate for those products. By separating the selection logic into a CTE, the query becomes easier to read and test independently.
*/