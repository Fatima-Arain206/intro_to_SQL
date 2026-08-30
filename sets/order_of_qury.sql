
use SalesDB
SELECT CustomerID,
	FirstName
from Sales.Customers

select 
EmployeeID,
LastName

from Sales.Employees

select 
	CustomerID AS ID,
	LastName AS LAST_NAME-- FIRST QUERY IS VERY IMPORTANT IT CONTROLLS THE WHOLE QURY
from Sales.Customers
union

select 
EmployeeID,
LastName

from Sales.Employees