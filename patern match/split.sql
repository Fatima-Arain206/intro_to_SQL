-- Split comma-separated values
DECLARE @tags NVARCHAR(200) = 'sql,database,azure,analytics';
SELECT value AS Tag
FROM REGEXP_SPLIT_TO_TABLE(@tags, ',');

-- Split on multiple delimiters (comma, semicolon, or pipe)
DECLARE @data NVARCHAR(200) = 'apple,banana;cherry|date';
SELECT value AS Fruit
FROM REGEXP_SPLIT_TO_TABLE(@data, '[,;|]');