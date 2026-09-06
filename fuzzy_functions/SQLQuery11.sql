INSERT INTO dbo.ReportsTo
    ($from_id, $to_id, StartDate, ReportType)
SELECT
    (SELECT $node_id
     FROM dbo.Person
     WHERE Name = 'Alice Johnson'),

    (SELECT $node_id
     FROM dbo.Person
     WHERE Name = 'Bob Smith'),

    '2023-01-15',
    'Direct';