# Labs

## SQL lab practice

This folder is for practical, hands-on SQL tasks.

## What you do in labs

- create tables
- insert data
- write queries
- fix bugs
- test edge cases

## Example lab query

```sql
SELECT CustomerId, COUNT(*) AS TotalOrders
FROM dbo.Order
GROUP BY CustomerId;
```

## Good lab workflow

1. understand the table
2. write a simple query
3. test the result
4. handle edge cases
5. optimize if needed

## Best habits

- start simple
- use `SELECT` before `UPDATE` or `DELETE`
- print intermediate results
- validate your assumptions

## Learning target

The purpose of labs is not just to finish tasks. The purpose is to understand why the query works.

This folder is for practice-based SQL learning.
