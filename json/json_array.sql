--json array
select JSON_ARRAY(
1,2,4,5,67,9
), JSON_ARRAY(
    'SQL Server',
    'Azure SQL Database',
    'SQL Database in Fabric'
) AS Platforms;