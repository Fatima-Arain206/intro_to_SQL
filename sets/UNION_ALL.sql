--UNION ALL
-- THIS gonna return all rows from both quries including duplicates
SELECT 
CustomerID
FROM Sales.Customers
UNION ALL
SELECT 
EmployeeID
FROM Sales.Employees
ORDER BY CustomerID DESC;

SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION ALL
SELECT 
FirstName,
LastName
FROM Sales.Employees