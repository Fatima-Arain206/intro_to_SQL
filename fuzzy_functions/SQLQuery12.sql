INSERT INTO dbo.Knows
    ($from_id, $to_id, ConnectionDate, ConnectionStrength)
SELECT
    (SELECT $node_id
     FROM dbo.Person
     WHERE Name = 'Alice Johnson'),

    (SELECT $node_id
     FROM dbo.Person
     WHERE Name = 'Carol Davis'),

    '2022-06-01',
    8;