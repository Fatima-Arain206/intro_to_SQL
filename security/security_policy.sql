CREATE SECURITY POLICY TenantSecurityPolicy
ADD FILTER PREDICATE Security.fn_TenantAccessPredicate(TenantID)
    ON dbo.Employees,
ADD FILTER PREDICATE Security.fn_TenantAccessPredicate(TenantID)
    ON dbo.Products
WITH (STATE = ON);