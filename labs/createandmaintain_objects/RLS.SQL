CREATE SCHEMA Security;
GO

CREATE FUNCTION Security.fn_TenantAccessPredicate(@TenantID int)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 AS fn_TenantAccessPredicate_Result
    WHERE @TenantID = CAST(SESSION_CONTEXT(N'TenantID') AS int);



    EXEC sp_set_session_context @key = N'TenantID', @value = 42;
    --For scenarios based on database users rather than session context, the predicate can reference the current user:


CREATE FUNCTION Security.fn_SalesRepPredicate(@SalesRepID int)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 AS fn_SalesRepPredicate_Result
    WHERE @SalesRepID = DATABASE_PRINCIPAL_ID()
       OR IS_MEMBER('SalesManagers') = 1;


       --Create security policies
--Once you've defined your predicate functions, create a security policy that applies them to table
CREATE SECURITY POLICY TenantSecurityPolicy
ADD FILTER PREDICATE Security.fn_TenantAccessPredicate(EmployeeID)
    ON dbo.Employees,
ADD FILTER PREDICATE Security.fn_TenantAccessPredicate(CustomerID)
    ON dbo.Customers
WITH (STATE = ON);

--You can combine filter and block predicates in a single policy:

CREATE SECURITY POLICY SalesSecurityPolicy
ADD FILTER PREDICATE Security.fn_SalesRepPredicate(EmployeeID)
    ON hr.Employee,
ADD BLOCK PREDICATE Security.fn_SalesRepPredicate(EmployeeID)
    ON hr.Employee AFTER INSERT,
ADD BLOCK PREDICATE Security.fn_SalesRepPredicate(EmployeeID)
    ON hr.Employee AFTER UPDATE
WITH (STATE = ON);


CREATE FUNCTION Security.fn_HierarchyPredicate(@OwnerID int)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN
    WITH EmployeeHierarchy AS (
        SELECT EmployeeID, ManagerID
        FROM dbo.Employees
        WHERE EmployeeID = DATABASE_PRINCIPAL_ID()

        UNION ALL

        SELECT e.EmployeeID
        FROM dbo.Employees e
        --INNER JOIN EmployeeHierarchy h ON e.ManagerID = h.EmployeeID
    )
    SELECT 1 AS fn_HierarchyPredicate_Result
   -- WHERE @OwnerID IN (SELECT EmployeeID FROM EmployeeHierarchy);


   SELECT p.name AS PolicyName,
       p.is_enabled,
       o.name AS TableName,
       pred.predicate_definition
FROM sys.security_policies p
INNER JOIN sys.security_predicates pred ON p.object_id = pred.object_id
INNER JOIN sys.objects o ON pred.target_object_id = o.object_id;