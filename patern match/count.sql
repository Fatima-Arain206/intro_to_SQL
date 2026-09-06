-- Count words in a description
SELECT  
    e.EmployeeName,
    REGEXP_COUNT(e.EmployeeName, '\w+') AS WordCount
FROM dbo.Employees e;

-- Count vowels in product names
SELECT 
    e.EmployeeName,
    REGEXP_COUNT(e.EmployeeName, '[aeiou]', 1, 'i') AS VowelCount
FROM dbo.Employees e;

-- Find products with multiple numbers in their name
SELECT e.EmployeeName
FROM dbo.Employees e
WHERE REGEXP_COUNT(e.EmployeeName, '\d+') > 1;