/*
Consider a scenario where you need to calculate employee tenure in years. 
You create a scalar function that accepts a hire date and returns the number of complete years:
*/



alter function dbo.getEmployeTenure
(
@hireDate date
)
returns int
as
begin
	 declare @tenure int = datediff(month,@hireDate,getdate())
	 return @tenure
 end;

 select
 e.EmployeeID,
 e.Department,
 e.Salary,
 dbo.getEmployeTenure(e.HireDate) as tenure_month
 from dbo.Employees as e
 where  dbo.getEmployeTenure(e.HireDate) > 10
 order by  dbo.getEmployeTenure(e.HireDate) desc
