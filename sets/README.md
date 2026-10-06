# SETS

## SQL set operations

Set operators combine query results.

## Common set operators

### UNION
Removes duplicates.

```sql
SELECT CustomerId FROM dbo.Customer
UNION
SELECT CustomerId FROM dbo.Order;
```

### UNION ALL
Keeps duplicates.

```sql
SELECT CustomerId FROM dbo.Customer
UNION ALL
SELECT CustomerId FROM dbo.Order;
```

### INTERSECT
Returns common rows.

```sql
SELECT CustomerId FROM dbo.Customer
INTERSECT
SELECT CustomerId FROM dbo.Order;
```

### EXCEPT
Returns rows in first query but not second.

```sql
SELECT CustomerId FROM dbo.Customer
EXCEPT
SELECT CustomerId FROM dbo.Order;
```

## Notes

- same number of columns
- compatible data types
- order of columns must match

This folder covers set theory operations in SQL.
