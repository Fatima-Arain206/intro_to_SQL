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
			 AND
			 schema_id = SCHEMA_ID(N'security'))
	DROP SECURITY POLICY security.EmployeeDepartmentPolicy;
GO

CREATE SECURITY POLICY security.EmployeeDepartmentPolicy
ADD FILTER PREDICATE security.fn_employee_department_access(ProductID)
	ON Sales.Products ,
ADD BLOCK PREDICATE security.fn_employee_department_access(ProductID)
	ON Sales.Products AFTER INSERT,
ADD BLOCK PREDICATE security.fn_employee_department_access(ProductID)
	ON Sales.Products AFTER UPDATE
WITH (STATE = ON);
GO



-- Set the department/product value for the current session






-- Set the department/security value for this session
EXEC sys.sp_set_session_context
    @key = N'ProductID',
    @value = 1;
GO

-- Retrieve all columns, including ProductID
SELECT
    p.*,
    CAST(SESSION_CONTEXT(N'ProductID') AS INT) AS CurrentSecurityValue
FROM Sales.Products AS p;
GO

-- Retrieve specific columns if available in dbo.Products
SELECT
    p.ProductID,
    p.Product,
    p.Price
FROM Sales.Products AS p;
GO