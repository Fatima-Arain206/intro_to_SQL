CREATE FUNCTION dbo.GetCustomerOrdersLAB
(@CusomerID int)
RETURNS  TABLE

RETURN(
    SELECT 
    D.OrderID,
    D.OrderDate
    FROM OrderDetails D
    WHERE D.ProductID = @CusomerID
)

SELECT *FROM DBO.GetCustomerOrdersLAB(2)

 SELECT CONCAT(c.CompanyName, ' ', c.ContactName) AS CustomerName, o.OrderID, o.OrderDate
 FROM Customers c
     CROSS APPLY dbo.GetCustomerOrdersLAB(c.CustomerID) o
 WHERE c.CustomerID = 2;