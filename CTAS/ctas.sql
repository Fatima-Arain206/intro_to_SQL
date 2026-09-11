--ctas
SELECT 
e.Department,
DATENAME(MONTH,e.HireDate) as HireMOnth
,count(e.EmployeeID) as totalEmployee
into dbo.ctasMonthlyEmployees
FROM
dbo.Employees e
group by DATENAME(MONTH,e.HireDate) ,e.Department

select * from dbo.ctasMonthlyEmployees