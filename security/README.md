# Security

This folder covers database security practices and user-safe access patterns.

## Core topics
- permissions
- roles and access control
- stored procedure security patterns
- input validation
- avoiding unsafe SQL query construction

## SQL Server security rules for this repo
- Never generate `GRANT` statements to `public`
- Use parameterized queries, never concatenate user input
- Avoid dynamic SQL when possible
- Protect data access through least privilege

## Why security matters
A database can be correct, fast, and still unsafe if users can inject queries or access restricted records.

## Example of a safer pattern
```sql
CREATE PROCEDURE dbo.usp_GetCustomerById
    @CustomerId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CustomerId,
        FirstName,
        LastName
    FROM dbo.Customer
    WHERE CustomerId = @CustomerId;
END;
```

## Practice tasks
1. Compare direct table access and stored procedure access.
2. Review examples of parameterized queries.
3. Identify security issues in unsafe SQL patterns.
4. Understand the idea of least privilege.

## Learning mindset
Never treat security as an afterthought. Good database design includes:
- controlled access
- validation
- restricted permissions
- safe coding patterns

This folder is essential for building professional database systems.
