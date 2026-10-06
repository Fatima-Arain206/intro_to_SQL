# JOins

## SQL join basics

Joins are used to combine data from two or more tables using a related column.

Think of it like this:
- table 1 = customers
- table 2 = orders
- join = match customer IDs

## Common joins

### 1. INNER JOIN
Only matching rows are returned.

```sql
SELECT c.CustomerId, c.FirstName, o.OrderId
FROM dbo.Customer AS c
INNER JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId;
```

### 2. LEFT JOIN
All rows from the left table are kept.

```sql
SELECT c.CustomerId, c.FirstName, o.OrderId
FROM dbo.Customer AS c
LEFT JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId;
```

### 3. RIGHT JOIN
All rows from the right table are kept.

```sql
SELECT c.CustomerId, c.FirstName, o.OrderId
FROM dbo.Customer AS c
RIGHT JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId;
```

### 4. FULL OUTER JOIN
All rows from both tables appear.

```sql
SELECT c.CustomerId, c.FirstName, o.OrderId
FROM dbo.Customer AS c
FULL OUTER JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId;
```

### 5. CROSS JOIN
Every row combines with every row.

```sql
SELECT c.CustomerId, p.ProductId
FROM dbo.Customer AS c
CROSS JOIN dbo.Product AS p;
```

## When to use which join?

- `INNER JOIN` = only matched records
- `LEFT JOIN` = keep all left data
- `RIGHT JOIN` = keep all right data
- `FULL JOIN` = keep both sides
- `CROSS JOIN` = all combinations

## Best practices

- Use aliases like `c`, `o`, `p`
- Put join conditions in `ON`
- Avoid joining without keys
- Check row multiplication carefully

## Practice

1. Show all customers with their orders
2. Find customers with no orders
3. Find orders with no matching customer
4. Compare both tables completely

This folder contains SQL examples and tasks for learning joins in depth.
