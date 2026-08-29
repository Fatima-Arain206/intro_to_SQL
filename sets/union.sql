-- unions 
-- sql set operators 
USE SalesDB
SELECT FirstName,LastName
FROM Sales.Employees

union

select FirstName,LastName
from Sales.Customers

