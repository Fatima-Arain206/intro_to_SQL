-- union 
SELECT		
c.FirstName,
c.LastName
 from Sales.Customers as c

 UNION
 SELECT 
 e.FirstName,
 e.LastName
 FROM Sales.Employees AS e

 -- the order of the columns
 -- the columns name in both table must be same
 -- the data type of both columns must be same
 -- the number of col in each query must be eqaul
 -- the order of the column in each query must be same

 select
  c.CustomerID,
  c.FirstName
  from Sales.Customers as c
  union
  select 
  e.EmployeeID,
  e.FirstName
  from Sales.Employees as  e
  -- rule no five
  -- coulmn aliases
  --the column names in the result set are determind by the
  --column names specified in the first query
