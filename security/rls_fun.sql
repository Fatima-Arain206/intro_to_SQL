
CREATE SCHEMA Security;
GO

CREATE FUNCTION Security.fn_TenantAccessPredicate(@TenantID int)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 AS fn_TenantAccessPredicate_Result
    WHERE @TenantID = CAST(SESSION_CONTEXT(N'TenantID') AS int);

    SELECT * FROM Security.fn_TenantAccessPredicate(1);
