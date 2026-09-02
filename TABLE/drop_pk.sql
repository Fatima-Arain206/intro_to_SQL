alter table [dbo].[Employees]
add constraint
pk_employees
primary key clustered
(EmployeeID,HireDate)
on PS_OrderDate(HireDate);