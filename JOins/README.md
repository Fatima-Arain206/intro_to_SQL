# Joins

This folder is all about combining data from multiple tables using SQL Server's join operations.

## Why joins matter

A database is usually normalized, which means data is spread across many tables. To answer real business questions, you often need to combine them.

Examples:
- Customer + Orders
- Employee + Department
- Product + Category
- Sale + Customer + Region

## Core SQL Server 2025 join rules

- Use ANSI JOIN syntax, not comma-separated tables.
- Always qualify columns with schema/table names when needed.
- Match keys carefully: PK to FK or equivalent business keys.
- Filter before joining when possible for better performance.
- Use `LEFT JOIN` when you need all rows from one side even if there is no match.

## Types of joins

### 1. INNER JOIN
Returns only matching rows.

```sql
SELECT
    c.CustomerId,
    c.FirstName,
    o.OrderId,
    o.OrderDate
FROM dbo.Customer AS c
INNER JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId;
```

Use when:
- You want only related records.
- You need a clean set of matched data.

### 2. LEFT JOIN
Returns all rows from the left table and matching rows from the right.

```sql
SELECT
    c.CustomerId,
    c.FirstName,
    o.OrderId
FROM dbo.Customer AS c
LEFT JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId;
```

Use when:
- You want customers even if they have no orders yet.
- You want to find missing relationships.

### 3. RIGHT JOIN
Returns all rows from the right table and matching rows from the left.

```sql
SELECT
    c.CustomerId,
    c.FirstName,
    o.OrderId
FROM dbo.Customer AS c
RIGHT JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId;
```

Use when:
- Your main concern is the table on the right side.
- Usually less common than LEFT JOIN.

### 4. FULL OUTER JOIN
Returns all rows from both sides.

```sql
SELECT
    c.CustomerId,
    c.FirstName,
    o.OrderId
FROM dbo.Customer AS c
FULL OUTER JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId;
```

Use when:
- You want to compare both tables completely.
- You want to find gaps on both sides.

### 5. CROSS JOIN
Returns every possible row combination.

```sql
SELECT
    c.CustomerId,
    c.FirstName,
    p.ProductId,
    p.ProductName
FROM dbo.Customer AS c
CROSS JOIN dbo.Product AS p;
```

Use only when you intentionally want the Cartesian product.

### 6. Anti join patterns
These help answer questions like: "Who has no order?"

```sql
SELECT
    c.CustomerId,
    c.FirstName
FROM dbo.Customer AS c
LEFT JOIN dbo.Order AS o
    ON c.CustomerId = o.CustomerId
WHERE o.CustomerId IS NULL;
```

This is a common pattern in reporting and data validation.

## Best practices

- Prefer clear aliases: `c`, `o`, `p`.
- Use `ON` for join conditions, not `WHERE` unless intentionally filtering after join.
- Avoid joining on non-indexed columns in large tables.
- Check row multiplication carefully; joins can explode row counts.
- Use `EXISTS` for membership checks when you don't need actual rows.

## Common mistakes

- Joining on wrong column names.
- Missing `ON` clause.
- Accidental Cartesian product from `CROSS JOIN`.
- Filtering too late and creating wrong results.

## Interview mindset

If someone asks, "What join should I use?" think:
- Need only matching rows? `INNER JOIN`
- Need all from left? `LEFT JOIN`
- Need all from right? `RIGHT JOIN`
- Need everything from both? `FULL OUTER JOIN`
- Need all combinations? `CROSS JOIN`

## Practice tasks

1. List all customers with their total number of orders.
2. Find customers who have never placed an order.
3. Show all products and the customers who bought them.
4. Compare orders with customers and identify null mismatches.

This folder contains files that practice these ideas in real SQL examples.
