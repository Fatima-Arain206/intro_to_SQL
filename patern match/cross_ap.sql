-- Split comma-separated values
DECLARE @tags NVARCHAR(200) = 'sql,database,azure,analytics';
SELECT value AS Tag
FROM REGEXP_SPLIT_TO_TABLE(@tags, ',');

-- Split on multiple delimiters (comma, semicolon, or pipe)
DECLARE @data NVARCHAR(200) = 'apple,banana;cherry|date';
SELECT value AS Fruit
FROM REGEXP_SPLIT_TO_TABLE(@data, '[,;|]');


-- Assuming Products table has a Tags column with comma-separated values
SELECT 
    p.EmployeeID,
    p.EmployeeName,
    t.value AS Tag
FROM dbo.Employees AS p
CROSS APPLY REGEXP_SPLIT_TO_TABLE(p.Department, ',\s*') AS t;