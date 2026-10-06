# Scalar Functions

## What are scalar functions?

Scalar functions return a single value based on input arguments.

## Example

```sql
CREATE FUNCTION dbo.GetFullName (@FirstName NVARCHAR(50), @LastName NVARCHAR(50))
RETURNS NVARCHAR(101)
AS
BEGIN
    RETURN CONCAT(@FirstName, ' ', @LastName);
END;
```

## Common usage

```sql
SELECT dbo.GetFullName(FirstName, LastName) AS FullName
FROM dbo.Customer;
```

## Why use them?

- reusable logic
- cleaner queries
- consistent formatting or calculations

## Best practices

- keep functions deterministic when possible
- avoid heavy logic in functions
- test performance carefully

This folder covers scalar function creation and use in SQL Server.
