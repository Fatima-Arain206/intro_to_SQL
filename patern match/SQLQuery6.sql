-- Find position of first digit in product number
SELECT 
    e.EmployeEmail,
    REGEXP_INSTR(e.EmployeEmail, '\d') AS FirstDigitPosition
FROM dbo.Employees e;

-- Find position of email domain
SELECT 
    e.EmployeEmail,
    REGEXP_INSTR(e.EmployeEmail, '@') AS AtPosition,
    REGEXP_INSTR(e.EmployeEmail, '\.[a-z]+$', 1, 1, 0, 'i') AS TldPosition
FROM dbo.Employees e
WHERE e.EmployeEmail IS NOT NULL;