# CTE (Common Table Expressions)

## What is a CTE?

A CTE is a temporary table-like result that exists only inside one query.

It helps you split complex SQL into small readable steps.

## Why use CTE?

- easier to read
- easier to debug
- better for repeated logic
- useful in advanced queries

## Basic syntax

```sql
WITH SalesSummary AS (
    SELECT CustomerId, COUNT(*) AS TotalOrders
    FROM dbo.Order
    GROUP BY CustomerId
)
SELECT *
FROM SalesSummary;
```

## Multi-CTE example

```sql
WITH CustomerOrders AS (
    SELECT CustomerId, COUNT(*) AS OrderCount
    FROM dbo.Order
    GROUP BY CustomerId
),
TopCustomers AS (
    SELECT CustomerId, OrderCount
    FROM CustomerOrders
    WHERE OrderCount > 2
)
SELECT *
FROM TopCustomers;
```

## Recursive CTE

Used to generate a sequence or traverse hierarchical data.

```sql
WITH Numbers AS (
    SELECT 1 AS N
    UNION ALL
    SELECT N + 1
    FROM Numbers
    WHERE N < 10
)
SELECT N
FROM Numbers;
```

## Best practices

- keep names meaningful
- use one CTE for one purpose
- avoid too many nested CTEs
- use `UNION ALL` when duplicates are okay

## Common mistakes

- recursive CTE without stopping condition
- too much logic in one CTE
- forgetting query order

## Real-world use

CTEs are great for:
- summary reports
- ranking logic
- hierarchical data
- step-by-step query building

This folder contains CTE examples for learning and practice.
