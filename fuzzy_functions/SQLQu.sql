-- count tables
SELECT COUNT(*) AS TableCount
FROM [salesdb].sys.tables;

-- list table names
SELECT name
FROM [salesdb].sys.tables
ORDER BY name;