# SET Operations

This folder teaches how to combine result sets using SQL set logic.

## Core topics
- `UNION`
- `UNION ALL`
- `INTERSECT`
- `EXCEPT` / `MINUS`-style logic in SQL Server (where applicable)

## Why set operations matter
Set operations help compare or combine queries without joining tables. They are useful when you want to:

- merge similar result sets
- find common rows
- find rows in one query but not another
- compare data snapshots

## Important rules
- The number and order of columns must match
- Data types must be compatible
- `UNION` removes duplicates, while `UNION ALL` keeps duplicates
- Use `ORDER BY` at the end of the final query

## Example
```sql
SELECT CustomerId, FirstName
FROM dbo.Customer
UNION ALL
SELECT CustomerId, FirstName
FROM dbo.CustomerArchive;
```

## Practice ideas
1. Compare `UNION` and `UNION ALL` output.
2. Use `INTERSECT` to find shared records.
3. Find records present in one table but not another.
4. Explain result ordering and duplicate handling.

## Learning tip
Set operations are conceptually different from joins:
- joins combine columns from different tables
- set operations combine rows from similar queries

This folder builds logical thinking about row comparison and data merging.
