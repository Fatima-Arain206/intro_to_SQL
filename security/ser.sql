CREATE SECURITY POLICY SalesSecurityPolicy
ADD FILTER PREDICATE Security.fn_SalesRepPredicate(SalesRepID)
    ON dbo.CustomerAccounts,
ADD BLOCK PREDICATE Security.fn_SalesRepPredicate(SalesRepID)
    ON dbo.CustomerAccounts AFTER INSERT,
ADD BLOCK PREDICATE Security.fn_SalesRepPredicate(SalesRepID)
    ON dbo.CustomerAccounts AFTER UPDATE
WITH (STATE = ON);