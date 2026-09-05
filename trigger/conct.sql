 SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName

 FROM Sales.Customers c
     CROSS APPLY Sales.GetCustomerOrders(c.CustomerID) o
 WHERE c.CustomerID = 2;