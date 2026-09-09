SELECT
    s.name AS SchemaName,
    t.name AS TableName
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
    ON s.schema_id = t.schema_id
ORDER BY
    s.name,
    t.name;

DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql +=
    N'SELECT * FROM ' + QUOTENAME(s.name) + N'.' + QUOTENAME(t.name) + N';' + CHAR(13) + CHAR(10)
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
    ON s.schema_id = t.schema_id
ORDER BY
    s.name,
    t.name;

EXEC sys.sp_executesql @sql;