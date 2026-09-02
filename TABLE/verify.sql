    INSERT INTO Products (ProductName, CategoryID, SupplierID, BasePrice, StockQuantity)
    VALUES ('Invalid', 1, 1, -50, 10);
    
      SELECT ProductName, JSON_VALUE(Metadata, '$.color') AS Color
    FROM Products
    WHERE Metadata IS NOT NULl

      -- Verify partitioning
    SELECT $PARTITION.PF_OrderDate(OrderDate) AS Partition, COUNT(*) AS RecordCount
    FROM [Order]
    GROUP BY $PARTITION.PF_OrderDate(OrderDate);
     --Verify temporal table
    SELECT ProductID, CurrentPrice, SysStartTime, SysEndTime
    FROM ProductPrice FOR SYSTEM_TIME ALL
    ORDER BY ProductID, SysStartTime;

