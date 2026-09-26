 -- Audit table
 IF OBJECT_ID('dbo.OrderAudit') IS NULL
 BEGIN
     CREATE TABLE dbo.OrderAudit (
         AuditID     INT IDENTITY(1,1) PRIMARY KEY,
         OrderID     INT NOT NULL,
         OldTotal    DECIMAL(18,2) NULL,
         NewTotal    DECIMAL(18,2) NULL,
         ChangedAt   DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
     );
 END
 GO

 -- Trigger on order details updates
 CREATE OR ALTER TRIGGER dbo.trg_LogOrderTotalChange
 ON dbo.OrderDetails
 AFTER INSERT, UPDATE
 AS
 BEGIN
     SET NOCOUNT ON;

     ;WITH AffectedOrders AS (
         SELECT OrderID FROM inserted
         UNION
         SELECT OrderID FROM deleted
     ),
     -- New totals from the base table (already reflects changes)
     NewTotals AS (
         SELECT d.OrderID, SUM(d.Quantity * d.UnitPrice) AS Total
         FROM dbo.OrderDetails d
         INNER JOIN AffectedOrders a ON d.OrderID = a.OrderID
         GROUP BY d.OrderID
     ),
     -- Contribution of the newly inserted/updated rows
     InsertedTotals AS (
         SELECT OrderID, SUM(Quantity * UnitPrice) AS Total
         FROM inserted
         GROUP BY OrderID
     ),
     -- Contribution of the previous row versions (empty on INSERT)
     DeletedTotals AS (
         SELECT OrderID, SUM(Quantity * UnitPrice) AS Total
         FROM deleted
         GROUP BY OrderID
     )
     INSERT INTO dbo.OrderAudit (OrderID, OldTotal, NewTotal)
     SELECT
         n.OrderID,
         n.Total - ISNULL(i.Total, 0) + ISNULL(d.Total, 0) AS OldTotal,
         n.Total AS NewTotal
     FROM NewTotals n
     LEFT JOIN InsertedTotals i ON n.OrderID = i.OrderID
     LEFT JOIN DeletedTotals d ON n.OrderID = d.OrderID;
 END;


  -- Update an order detail to change the total
 UPDATE d
 SET Quantity = Quantity + 1
 FROM OrderDetails d
 WHERE d.OrderID = (SELECT TOP 1 OrderID FROM [Order] ORDER BY OrderID DESC);
    
 SELECT TOP (5) * 
 FROM dbo.OrderAudit 
 ORDER BY AuditID DESC;