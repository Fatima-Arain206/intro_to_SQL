# JOINs

This folder is dedicated to learning how data is combined across tables in SQL Server.

## Why joins matter
Real databases store related information in different tables. A join lets you combine those tables meaningfully so you can answer real business questions like:

- Which customer placed this order?
- Which product belongs to this category?
- Which employees have no assigned manager?

## Core join types
- INNER JOIN: only matching rows from both tables
- LEFT JOIN: all rows from the left table, matches from the right when available
- RIGHT JOIN: all rows from the right table
- FULL OUTER JOIN: both sides, including unmatched rows
- CROSS JOIN: every row from one table combines with every row from the other
- SELF JOIN: a table joined to itself
- ANTI JOIN / FULL ANTI JOIN: rows that do not match in a useful way

## SQL Server conventions
- Always use ANSI JOIN syntax
- Prefer explicit column names and schema prefixes
- Use `ON` conditions to define relationship logic
- Validate whether the join is one-to-one, one-to-many, or many-to-many

## Example
```sql
SELECT
    c.CustomerId,
    c.FirstName,
    o.OrderId,
    o.OrderDate
FROM dbo.Customer AS c
INNER JOIN dbo.[Order] AS o
    ON c.CustomerId = o.CustomerId;
```

## What to practice
1. Compare INNER vs LEFT JOIN output.
2. Check unmatched records using `IS NULL`.
3. Write multiple-table joins step by step.
4. Understand duplicate rows caused by many-to-many relationships.

## Learning tip
When you see a join question, first identify:
- Which table is the main table?
- Which table provides the extra details?
- What is the matching column?
- Are you expected to keep unmatched rows?

This is one of the most important SQL topics because almost every real-world report uses joins.
