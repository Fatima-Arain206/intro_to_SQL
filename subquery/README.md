# Subqueries (Nested Query Logic)

## Overview
Subqueries let you solve a problem in layers: inner query computes a set/value, outer query consumes it.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuery4.sql` | SQLQuery4 |
| `SQLQuery6.sql` | SQLQuery6 |
| `correlated_subquery.sql` | correlated subquery |
| `error_h.sql` | error h |
| `subquury.sql` | subquury |

## Example: filter by aggregate from subquery
```sql
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM dbo.Customer AS c
WHERE c.CustomerId IN (
    SELECT
        o.CustomerId
    FROM dbo.[Order] AS o
    GROUP BY o.CustomerId
    HAVING SUM(o.TotalAmount) > 50000
);
```
Line-by-line:
1. Outer query returns customer identity columns.
2. `IN` compares outer `CustomerId` with inner result set.
3. Inner query groups orders per customer.
4. `HAVING` keeps customers above spending threshold.

Expected result: high-value customers only.

## Common mistakes
- Using `=` when inner query returns multiple rows.
- Correlated subquery without supporting index.

## Best practices
- Prefer `EXISTS` for existence checks.
- Rewrite deeply nested patterns into CTE for readability.

## DSA connection
Think of subqueries as composable functions: output set from one step becomes input set for next step.

## Exercises
1. Rewrite the above with `EXISTS`.
2. Build correlated subquery returning latest order date per customer.
