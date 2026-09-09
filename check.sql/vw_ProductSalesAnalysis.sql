CREATE OR ALTER VIEW dbo.vw_ProductSalesAnalysis
AS
SELECT
	p.Name,
	p.ProductCategoryID
FROM dbo.Products AS p;
GO
select * from dbo.vw_ProductSalesAnalysis
