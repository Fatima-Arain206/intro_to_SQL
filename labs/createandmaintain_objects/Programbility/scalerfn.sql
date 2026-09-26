create FUNCTION dbo.fnOrderTotal
(@OrderID int)
RETURNS DECIMAL(10,3)
as
 BEGIN
DECLARE  @totalOrder decimal(10,3)

SELECT
@totalOrder=sum(LineTotal)
from OrderDetails
where OrderID = @OrderID


RETURN isnull( @totalOrder,0.00)
end


 SELECT d.OrderID, dbo.fnOrderTotal(d.OrderID) AS OrderTotal
 FROM dbo.OrderDetails d
 GROUP BY d.OrderID
 ORDER BY d.OrderID DESC;