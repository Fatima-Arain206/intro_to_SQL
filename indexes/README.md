# Indexes

This folder is about database performance and access optimization.

## What indexes do
Indexes help SQL Server quickly find rows without scanning the entire table.

## Common index types
- clustered index
- nonclustered index
- unique index
- filtered index
- composite index

## Why indexes matter
Without indexes, queries may need full table scans. This is slower on large datasets and impacts real workload performance.

## Example
```sql
CREATE NONCLUSTERED INDEX IX_Customer_LastName
ON dbo.Customer (LastName);
```

## Good performance mindset
- Index the columns used in `WHERE`, `JOIN`, and `ORDER BY`
- Avoid unnecessary indexes on every column
- Use `EXISTS` rather than `COUNT(*)` for existence checks
- Check actual query plans before and after adding indexes

## Practice tasks
1. Create an index on a frequently filtered column.
2. Compare query times with and without an index.
3. Learn when indexes help and when they hurt.
4. Review execution plan impacts.

## Learning tip
Performance tuning is not about adding indexes everywhere. It is about understanding the workload and choosing the correct access path.
