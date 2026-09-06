-- Extract domain from email address
SELECT 
    e.EmployeEmail,
    REGEXP_SUBSTR(e.EmployeEmail, '@(.+)$', 1, 1, '', 1) AS Domain
FROM dbo.Employees e
WHERE e.EmployeEmail IS NOT NULL;

-- Extract the first number from a string
SELECT 
    EmployeEmail,
    REGEXP_SUBSTR(EmployeEmail, '\d+') AS FirstNumber
FROM dbo.Employees;