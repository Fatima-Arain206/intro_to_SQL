 -- Create users for different sales regions
 CREATE USER WestSalesRep WITHOUT LOGIN;
 CREATE USER EastSalesRep WITHOUT LOGIN;

 -- Grant SELECT permission on Customers table
 GRANT SELECT ON dbo.Customers TO WestSalesRep;
 GRANT SELECT ON dbo.Customers TO EastSalesRep;