IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'security')
	EXEC(N'CREATE SCHEMA security');
GO

CREATE OR ALTER FUNCTION security.fn_employee_department_access
(
	@ProductID INT
)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN
(
	SELECT 1 AS access_granted
	WHERE @ProductID = CAST(SESSION_CONTEXT(N'ProductID') AS INT)
	   
);
GO

IF EXISTS (SELECT 1 FROM sys.security_policies
		   WHERE name = N'EmployeeDepartmentPolicy'
			 AND schema_id = SCHEMA_ID(N'security'))
	DROP SECURITY POLICY security.EmployeeDepartmentPolicy;
GO

CREATE SECURITY POLICY security.EmployeeDepartmentPolicy
ADD FILTER PREDICATE security.fn_employee_department_access(ProductID)
	ON dbo.Products ,
ADD BLOCK PREDICATE security.fn_employee_department_access(ProductID)
	ON dbo.Products AFTER INSERT,
ADD BLOCK PREDICATE security.fn_employee_department_access(ProductID)
	ON dbo.Products AFTER UPDATE
WITH (STATE = ON);
GO



-- Set the department/product value for the current session
EXEC sys.sp_set_session_context
    @key = N'ProductID',
    @value = 1;

-- Retrieve rows allowed by the security policy
SELECT
    ProductID,
    *,
    CAST(SESSION_CONTEXT(N'ProductID') AS INT) AS SessionProductID
FROM dbo.Products;
GO

-- Test access to another ProductID
EXEC sys.sp_set_session_context
    @key = N'ProductID',
    @value = 999999;

SELECT
    ProductID,
    *,
    CAST(SESSION_CONTEXT(N'ProductID') AS INT) AS SessionProductID
FROM dbo.Products;
GO

-- Verify that the security policy is enabled
SELECT
    name AS PolicyName,
    is_enabled
FROM sys.security_policies
WHERE name = N'EmployeeDepartmentPolicy';
GO


