# CTE (Common Table Expressions)

## Overview
CTEs help you break a complex query into readable, testable steps.

## Learning objectives
- Write single and multiple CTE chains.
- Use recursive CTEs safely.
- Compare CTEs with temp tables and subqueries.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `CURRENT.sql` | CURRENT |
| `DATEsEQ.sql` | DATEsEQ |
| `SQLQuery2.sql` | SQLQuery2 |
| `SQLQuery3.sql` | SQLQuery3 |
| `SQLQuery4.sql` | SQLQuery4 |
| `SQLQuery5.sql` | SQLQuery5 |
| `UPDATECTE.sql` | UPDATECTE |
| `cte1.sql` | cte1 |
| `multipleCte_with1.sql` | multipleCte with1 |
| `non_rec.sql` | non rec |
| `recvursive.sql` | recvursive |
| `series.sql` | series |

## Self-contained example
```sql
WITH MonthlySales AS (
    SELECT
        o.CustomerId,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS SalesMonth,
        SUM(o.TotalAmount) AS MonthlyAmount
    FROM dbo.[Order] AS o
    GROUP BY
        o.CustomerId,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
)
SELECT
    ms.CustomerId,
    ms.SalesMonth,
    ms.MonthlyAmount
FROM MonthlySales AS ms
WHERE ms.MonthlyAmount > 10000;
```
Line-by-line:
1. `MonthlySales` CTE computes reusable monthly aggregation.
2. `DATEFROMPARTS` normalizes to month start.
3. `SUM` + `GROUP BY` builds per-customer monthly totals.
4. Outer query filters high-value months.

Expected result: rows where monthly spend exceeds threshold.

## Edge cases
- Recursive CTE infinite loop without stop condition.
- Non-deterministic ordering assumptions in recursion.

## Performance notes
- CTE is a query expression, not guaranteed materialization.
- For reused heavy intermediate data, compare temp table strategy.

## DSA connection
Recursive CTEs model tree/graph traversal (DFS/BFS thinking).

## Exercises
1. Build date series CTE for last 30 days.
2. Traverse employee-manager hierarchy recursively.
