# Subqueries

This folder introduces queries nested inside other queries.

## Why subqueries matter
A subquery lets you answer questions in stages. It helps when you need to compute something first and then use that result in an outer query.

## Common patterns
- subquery in `WHERE`
- subquery in `SELECT`
- subquery in `FROM`
- correlated subquery
- nested subqueries

## Example
```sql
SELECT
    CustomerId,
    FirstName,
    LastName
FROM dbo.Customer
WHERE CustomerId IN (
    SELECT CustomerId
    FROM dbo.[Order]
    WHERE TotalAmount > 500
);
```

## Benefits
- break complex logic into smaller problems
- work with results from nested queries
- express filtering based on aggregated data

## Practice tasks
1. Write a subquery to filter using aggregated sales.
2. Use a subquery in a `SELECT` list.
3. Compare subquery and join approaches.
4. Understand correlated subquery behavior.

This is a foundational topic before moving to advanced query design.
