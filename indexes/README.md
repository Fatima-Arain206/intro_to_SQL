# Indexes

## What is an index?

An index helps SQL Server find rows faster, just like an index in a book helps you locate a topic quickly.

## Why we need indexes

Without indexes, SQL Server may scan the whole table.

```sql
SELECT *
FROM dbo.Customer
WHERE CustomerId = 1001;
```

If there is a primary key index, lookup is fast.

## Types of indexes

### Clustered index
The table data is stored in the order of this index.

### Nonclustered index
A separate structure points to records.

```sql
CREATE NONCLUSTERED INDEX IX_Customer_LastName
ON dbo.Customer(LastName);
```

### Composite index
Multiple columns together.

```sql
CREATE NONCLUSTERED INDEX IX_Order_CustomerId_OrderDate
ON dbo.Order(CustomerId, OrderDate);
```

## Create / drop

```sql
CREATE INDEX IX_Customer_Email
ON dbo.Customer(Email);
```

```sql
DROP INDEX IX_Customer_Email
ON dbo.Customer;
```

## Best practices

- index columns in `WHERE`, `JOIN`, and `ORDER BY`
- avoid too many unnecessary indexes
- use composite indexes when needed
- check execution plans

## Common mistakes

- indexing every column
- poor index design
- not measuring performance

This folder focuses on index creation, optimization, and practical SQL performance learning.
