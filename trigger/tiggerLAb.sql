 -- Audit table
 IF OBJECT_ID('Sales.OrderAudit') IS NULL
 BEGIN
     CREATE TABLE Sales.OrderAudit (
         AuditID     INT IDENTITY(1,1) PRIMARY KEY,
         OrderID     INT NOT NULL,
         OldTotal    DECIMAL(18,2) NULL,
         NewTotal    DECIMAL(18,2) NULL,
         ChangedAt   DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
     );
 END
 GO

 -- Trigger on order details updates
 CREATE OR ALTER TRIGGER Sales.trg_LogOrderTotalChange
 ON Sales.Orders
 AFTER INSERT, UPDATE
 AS
 BEGIN
     SET NOCOUNT ON;

     ;WITH AffectedOrders AS (
         SELECT CustomerID FROM inserted
         UNION
         SELECT CustomerID FROM deleted
     ),
     -- New totals from the base table (already reflects changes)
     NewTotals AS (
         SELECT d.CustomerID, SUM(d.Quantity * d.Sales) AS Total
         FROM Sales.Orders d
         INNER JOIN AffectedOrders a ON d.CustomerID = a.CustomerID

         GROUP BY d.CustomerID
     ),
     -- Contribution of the newly inserted/updated rows
     InsertedTotals AS (
         SELECT CustomerID, SUM(Quantity * Sales) AS Total
         FROM inserted
         GROUP BY CustomerID
     ),
     -- Contribution of the previous row versions (empty on INSERT)
     DeletedTotals AS (
         SELECT CustomerID, SUM(Quantity * Sales) AS Total
         FROM deleted
         GROUP BY CustomerID
     )
     INSERT INTO Sales.OrderAudit (OrderID, OldTotal, NewTotal)
     SELECT
         n.CustomerID,
         n.Total - ISNULL(i.Total, 0) + ISNULL(d.Total, 0) AS OldTotal,
         n.Total AS NewTotal
     FROM NewTotals n
     LEFT JOIN InsertedTotals i ON n.CustomerID = i.CustomerID
     LEFT JOIN DeletedTotals d ON n.CustomerID = d.CustomerID;
 END;