# Scalar Functions

This folder covers single-row functions that transform values for each row in a query.

## Use cases
- string cleaning
- date calculations
- number formatting
- conditional logic
- business rules

## Typical functions
- `CAST` / `CONVERT`
- `ABS`, `ROUND`
- `DATEADD`, `DATEDIFF`
- `CASE WHEN`

## Example
```sql
SELECT
    CustomerId,
    FirstName,
    CASE
        WHEN IsActive = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS Status
FROM dbo.Customer;
```

## Learning goal
Understand that scalar functions work row by row and are different from aggregate functions, which summarize many rows together.

## Practice tasks
1. Convert dates to a readable format.
2. Use `CASE` for status flags.
3. Compare scalar and aggregate behavior.
4. Explain when to use functions in the `SELECT` list vs computed columns.

This folder builds the skill of transforming raw values into business-friendly data.
