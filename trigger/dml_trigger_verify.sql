select * from Sales.Employees
select * from Sales.AuditEmploye
insert into Sales.Employees
values(6,'Fatima','Arain','Devlopment','2003-12-11','F',90000,4)


update Sales.Employees
set ManagerID = 1
where EmployeeID=1

delete from Sales.Employees
where EmployeeID = 3