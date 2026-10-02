CREATE OR ALTER FUNCTION dbo.inline_table_order
(
    -- @OrderID INT
)
RETURNS -- Get a list of tables and views in the current database
SELECT table_catalog [database], table_schema [schema], table_name name, table_type type
FROM INFORMATION_SCHEMA.TABLES
GO
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