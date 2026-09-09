CREATE OR ALTER PROCEDURE dbo.usp_GetCustomerOrderSummary
	@ProductCategoryID INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		p.Product,
		p.ProductCategoryID
	FROM Sales.Products AS p
	WHERE @ProductCategoryID IS NULL
	   OR p.ProductCategoryID = @ProductCategoryID
	ORDER BY
		p.Name;
END;
GO

EXEC dbo.usp_GetCustomerOrderSummary;