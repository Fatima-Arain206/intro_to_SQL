-- Carol reports to Bob
INSERT INTO dbo.ReportsTo
    ($from_id, $to_id, StartDate, ReportType)
SELECT
    (SELECT $node_id FROM dbo.Person WHERE Name = 'Carol Davis'),
    (SELECT $node_id FROM dbo.Person WHERE Name = 'Bob Smith'),
    '2023-03-10',
    'Direct';


-- David reports to Bob
INSERT INTO dbo.ReportsTo
    ($from_id, $to_id, StartDate, ReportType)
SELECT
    (SELECT $node_id FROM dbo.Person WHERE Name = 'David Lee'),
    (SELECT $node_id FROM dbo.Person WHERE Name = 'Bob Smith'),
    '2023-05-20',
    'Direct';


-- Bob reports to Alice
INSERT INTO dbo.ReportsTo
    ($from_id, $to_id, StartDate, ReportType)
SELECT
    (SELECT $node_id FROM dbo.Person WHERE Name = 'Bob Smith'),
    (SELECT $node_id FROM dbo.Person WHERE Name = 'Alice Johnson'),
    '2022-01-15',
    'Direct';