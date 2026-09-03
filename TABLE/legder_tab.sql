--LADGER TABLE
CREATE TABLE DBO.Financial_Transactions(
TransactionID int primary key identity,
AccountNumber nvarchar(20),
Amount decimal(10,2),
TransactionType nvarchar(50)
) with(Ledger =on );

CREATE TABLE dbo.AuditLog (
    LogID INT PRIMARY KEY IDENTITY,
    EventDescription NVARCHAR(500),
    EventTimestamp DATETIME2
) WITH (LEDGER = ON (APPEND_ONLY = ON));