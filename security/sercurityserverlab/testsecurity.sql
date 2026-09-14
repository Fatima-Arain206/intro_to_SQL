 -- Test as WestSalesRep (should see only West region customers)
 EXECUTE AS USER = 'WestSalesRep';
 SELECT * FROM dbo.Customers;
 REVERT;

 -- Test as EastSalesRep (should see only East region customers)
 EXECUTE AS USER = 'EastSalesRep';
 SELECT * FROM dbo.Customers;
 REVERT;

 -- Test as admin (should see all customers)
 SELECT * FROM dbo.Customers;