CREATE FUNCTION Security.fn_SalesRepPredicate(@SalesRepID int)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 AS fn_SalesRepPredicate_Result
    WHERE @SalesRepID = DATABASE_PRINCIPAL_ID()
       OR IS_MEMBER('SalesManagers') = 1;