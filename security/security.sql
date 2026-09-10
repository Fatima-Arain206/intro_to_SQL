CREATE SCHEMA [Security];
GO

CREATE FUNCTION Security.EmployeeTanetpre
(
    @TanetID int
)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN
(
    SELECT 1 AS EmployeeTanetpre_Result
    WHERE @TanetID = CAST(SESSION_CONTEXT(N'TanetID') AS int)
       OR IS_MEMBER(N'EmployeeManagers') = 1
);
GO

--C
CREATE SECURITY POLICY Security.EmployeeTanetPolicy
ADD FILTER PREDICATE Security.EmployeeTanetpre(TanetID) ON dbo.Employees 
ADD BLOCK PREDICATE Security.EmployeeTanetpre(TanetID) ON dbo.Employees 
AFTER INSERT, UPDATE, DELETE

--ADD BLOCK PREDICATE Security.EmployeeTanetpre(TanetID) ON dbo.Employees  AFTER INSERT, UPDATE, DELETE

WITH (STATE = ON)

EXEC Security.EmployeeTanetPre
@key = N'TanetID',@value = 1


