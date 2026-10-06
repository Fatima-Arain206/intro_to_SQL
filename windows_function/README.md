# Windows Functions

This folder teaches ranking and analytical functions in SQL Server.

## What window functions do
A window function calculates a value across a set of rows related to the current row, without collapsing the rows like `GROUP BY` does.

## Common functions
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `NTILE()`
- `SUM() OVER()`
- `AVG() OVER()`
- `LEAD()` / `LAG()`

## Example
```sql
SELECT
    CustomerId,
    OrderDate,
    TotalAmount,
    ROW_NUMBER() OVER (PARTITION BY CustomerId ORDER BY OrderDate DESC) AS rn
FROM dbo.[Order];
```

## Why this matters
Window functions are used in:
- reporting
- ranking
- trend analysis
- cumulative totals
- comparing current and previous rows

## Practice tasks
1. Rank customers by total sales.
2. Compare `ROW_NUMBER` vs `RANK`.
3. Use `LAG`/`LEAD` to track changes over time.
4. Calculate running totals with `SUM() OVER()`.

This folder is essential for analytical SQL and business reporting.
