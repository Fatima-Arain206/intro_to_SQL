CREATE OR ALTER FUNCTION dbo.inline_table_order
(
    -- @OrderID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        OrderID,
        OrderDate,
        TotalAmount
    FROM dbo.[Order]
    -- WHERE OrderID = @OrderID
);
GO

SELECT * FROM dbo.inline_table_order();