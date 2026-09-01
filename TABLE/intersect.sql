--intersect
-- intersect returns only  common rows from both quries

SELECT 
FirstName,LastName
FROM Sales.Customers
INTERSECT
SELECT
FirstName,LastName
FROM
Sales.Employees
