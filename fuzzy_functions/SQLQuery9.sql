CREATE TABLE dbo.ReportsTo (
    StartDate DATE,
    ReportType NVARCHAR(50)
) AS EDGE;


CREATE TABLE dbo.Purchased (
    PurchaseDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2)
) AS EDGE;


CREATE TABLE dbo.Knows (
    ConnectionDate DATE,
    ConnectionStrength INT
) AS EDGE;