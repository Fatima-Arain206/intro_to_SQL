-- veiw
create view Sales.FirstView2
as select
c.FirstName,c.LastName,
c.Country,
e.Gender,e.FirstName,e.LastName

from Sales.Customers as c
inner join Sales.Employees as e
on c.CustomerID = e.EmployeeID