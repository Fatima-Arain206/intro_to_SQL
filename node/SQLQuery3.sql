begin transaction
CREATE TABLE dbo.Person1 (
    PersonID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
) AS NODE;
select * from dbo.Knows
rollback transaction
CREATE TABLE dbo.Re (
    ConnectionDate DATE
) AS EDGE;