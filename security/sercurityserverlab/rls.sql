 -- Create a schema for security objects
 CREATE SCHEMA Security;
 GO

 -- Create a function that determines which rows a user can see
 CREATE FUNCTION Security.fn_RegionFilter(@SalesRegion nvarchar(20))
 RETURNS TABLE
 WITH SCHEMABINDING
 AS
 RETURN SELECT 1 AS AccessGranted
     WHERE @SalesRegion = 
         CASE USER_NAME()
             WHEN 'WestSalesRep' THEN 'West'
             WHEN 'EastSalesRep' THEN 'East'
             ELSE @SalesRegion -- Admins see all regions
         END
        OR IS_MEMBER('db_owner') = 1;
 GO


 -- security policy
  -- Create security policy
 CREATE SECURITY POLICY CustomerRegionPolicy
 ADD FILTER PREDICATE Security.fn_RegionFilter(SalesRegion)
     ON dbo.Customers
 WITH (STATE = ON);