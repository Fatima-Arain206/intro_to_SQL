# CTE (Common Table Expressions)

This folder focuses on CTEs, which make queries easier to read and break into logical steps.

## What a CTE is
A CTE is a temporary named result set used inside a query. It helps you organize complex logic without creating a permanent table.

## Why CTEs are useful
- simplify multi-step queries
- improve readability
- support recursive queries
- make debugging easier

## Example
```sql
WITH ActiveCustomers AS (
    SELECT
        CustomerId,
        FirstName,
        LastName
    FROM dbo.Customer
    WHERE IsActive = 1
)
SELECT
    *
FROM ActiveCustomers;
```

## Advanced use case
CTEs are especially helpful when you write:
- aggregated steps followed by final filtering
- recursive hierarchical queries
- query decomposition for readability

## Practice tasks
1. Create a CTE from a filtered result set.
2. Join a CTE to another table.
3. Write a recursive CTE for hierarchical data.
4. Compare a CTE to a subquery.

This folder is important because readable SQL is maintainable SQL.
