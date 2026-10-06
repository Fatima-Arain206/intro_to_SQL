# Windows Function

## What are window functions?

Window functions perform calculations across rows related to the current row without grouping the result set.

## Common examples

### ROW_NUMBER
```sql
SELECT CustomerId, FirstName,
       ROW_NUMBER() OVER (ORDER BY CustomerId) AS RowNum
FROM dbo.Customer;
```

### RANK
```sql
SELECT CustomerId, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS RankValue
FROM dbo.Order;
```

### LAG / LEAD
```sql
SELECT CustomerId, OrderDate,
       LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
       LEAD(OrderDate) OVER (ORDER BY OrderDate) AS NextOrderDate
FROM dbo.Order;
```

## Why they matter

Window functions are used heavily in:
- ranking
- running totals
- comparisons with previous/next row
- analytics queries

## Best practices

- use `OVER (PARTITION BY ...)` for grouping within categories
- keep logic readable
- use them for analytical reporting, not for simple row filtering

This folder contains SQL examples for window functions and analytics queries.
