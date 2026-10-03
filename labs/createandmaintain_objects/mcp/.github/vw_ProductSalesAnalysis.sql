CREATE VIEW employee.vw_ProductSalesAnalysis
AS
SELECT
	p.ProductName,
	c.CategoryName,
	COALESCE(SUM(od.Quantity), 0) AS TotalQuantitySold,
	COALESCE(SUM(od.Quantity * od.UnitPrice), 0) AS TotalRevenue,
	AVG(od.UnitPrice) AS AverageSalePrice,
	COUNT(DISTINCT od.OrderID) AS NumberOfOrders
FROM employee.Products AS p
LEFT JOIN employee.Categories AS c
	ON c.CategoryID = p.CategoryID
LEFT JOIN employee.OrderDetails AS od
	ON od.ProductID = p.ProductID
GROUP BY
	p.ProductID,
	p.ProductName,
	c.CategoryName;
