-- Find customers with similar names to a search term
DECLARE @searchName NVARCHAR(100) = 'Jon Smith';

SELECT 
    CustomerID,
    FirstName,
    LastName,
    FirstName + ' ' + LastName AS FullName,
    EDIT_DISTANCE(@searchName, FirstName + ' ' + LastName) AS EditDistance
FROM Sales.Customers
WHERE EDIT_DISTANCE(@searchName, FirstName + ' ' + LastName) <= 3
ORDER BY EDIT_DISTANCE(@searchName, FirstName + ' ' + LastName);