# Security — Least Privilege and Safe Querying in SQL Server

## Purpose
Security controls who can read/modify data and how safely query logic executes.

## Prerequisites/objectives
- Understand logins/users/roles.
- Apply least privilege and parameterized patterns.

## Mental model
```mermaid
flowchart LR
  A[Login] --> B[Database User]
  B --> C[Role Membership]
  C --> D[Object Permissions]
```

## Core principles for this repository
- No permissive `GRANT` to `public`.
- Use procedures/views for controlled exposure.
- Avoid dynamic SQL unless unavoidable.

## Example: role-based access
```sql
CREATE ROLE SalesReader;
GO

GRANT SELECT ON dbo.Customer TO SalesReader;
GRANT SELECT ON dbo.[Order] TO SalesReader;
```
Line-by-line:
- Role groups permissions for maintainability.
- Explicit object grants prevent accidental broad access.

## Example: parameterized dynamic SQL (safe pattern)
```sql
DECLARE @SqlText NVARCHAR(MAX) = N'
SELECT
    c.CustomerID,
    c.CustomerName
FROM dbo.Customer AS c
WHERE c.CustomerName LIKE @NamePattern;';

EXEC sp_executesql
    @SqlText,
    N'@NamePattern NVARCHAR(120)',
    @NamePattern = N'A%';
```

## NULL/edge cases
- Permission denied may appear as empty result in app layer if errors are swallowed.
- Ownership chaining can permit access indirectly—review object owners.

## Performance and maintainability
- Security predicates (RLS) can affect plans.
- Keep permission scripts versioned and auditable.

## Debugging method
1. `EXECUTE AS USER = '...'` to reproduce.
2. Check role membership and effective permissions.
3. Validate application connection principal.

## Exercises
1. Beginner: create read-only role for reports.
2. Intermediate: deny direct table access but allow proc execution.
3. Advanced: model row-level access strategy.

DSA link: access control resembles guard conditions before state mutation/read.

## Navigation
Previous: [trigger](../trigger/README.md)  
Next: [security project](./MyDatabaseProject/README.md)
