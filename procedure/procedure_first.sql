-- procedure
create procedure dbo.first_procedure1
as
BEGIN 
		SET NOCOUNT ON
		SELECT 
			e.EmployeeID,
			e.EmployeeName,
			e.Salary,
			e.EmployeEmail,
			e.HireDate
		FROM dbo.Employees as e
		where e.Salary > 30000
		order by HireDate desc;
		end;

		-- verfi
		exec dbo.first_procedure1
		drop procedure dbo.first_procedure
