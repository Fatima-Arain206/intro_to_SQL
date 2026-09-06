SELECT 
    c.CustomerID,
    c.FirstName,
    JSON_ARRAYAGG(soh.OrderID) AS OrderIds
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS soh
    ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName;
/*The function collects all matching values from the grouped rows and combines them into a single JSON array. This method is useful for creating denormalized API responses from normalized database tables.
*/