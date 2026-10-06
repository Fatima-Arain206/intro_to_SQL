# View

## What is a view?

A view is a virtual table created from a query.

It does not store data itself; it shows the result of a query whenever accessed.

## Example view

```sql
CREATE VIEW dbo.CustomerOrderSummary AS
SELECT c.CustomerId, c.FirstName, COUNT(o.OrderId) AS TotalOrders
FROM dbo.Customer AS c
LEFT JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId
GROUP BY c.CustomerId, c.FirstName;
```

## Why views are useful

- simplify complex queries
- hide table complexity
- provide reusable reporting layer
- secure columns or rows

## Special view concepts

- `WITH SCHEMABINDING`
- `WITH CHECK OPTION`
- indexed views (advanced)

## Best practices

- keep views simple
- use views for consistent reporting
- avoid overloading them with complex logic

This folder contains examples for learning SQL views and their practical use.
