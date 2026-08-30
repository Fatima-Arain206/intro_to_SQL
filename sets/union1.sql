--unions
--returns all district rows from 
-- removes duplicates rows from the result
use SalesDB
SELECT 
	FirstName,
	LastName
FROM Sales.Customers
UNION
SELECT 
	FirstName,
	LastName
FROM Sales.Employees