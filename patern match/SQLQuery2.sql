-- Find customers with email addresses from specific domains
SELECT EmployeeID, EmployeeName,  EmployeEmail
FROM dbo.Employees
WHERE REGEXP_LIKE(EmployeEmail, '@.*\.com$') ;