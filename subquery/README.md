# Subquery

## What is a subquery?

A subquery is a query inside another query.

## Simple example

```sql
SELECT FirstName
FROM dbo.Customer
WHERE CustomerId IN (
    SELECT CustomerId
    FROM dbo.Order
);
```

## Correlated subquery

A correlated subquery depends on the outer query.

```sql
SELECT c.CustomerId, c.FirstName
FROM dbo.Customer AS c
WHERE EXISTS (
    SELECT 1
    FROM dbo.Order AS o
    WHERE o.CustomerId = c.CustomerId
);
```

## When to use subqueries

- filter based on another query
- compare values against aggregates
- build nested logic

## Best practices

- keep subqueries readable
- avoid unnecessary nesting
- use `EXISTS` for existence checks

This folder contains examples for learning subqueries and correlated queries.
