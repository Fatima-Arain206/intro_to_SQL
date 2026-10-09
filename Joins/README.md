# JOINS: Combining Related Data Correctly

## Overview
This folder practices relational joins for reporting and business queries.

## Learning objectives
- Choose correct join type for the business question.
- Prevent accidental row multiplication.
- Handle `NULL` and missing relationships safely.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuery1.sql` | SQLQuery1 |
| `SQLQuery1_inner_Join.sql` | SQLQuery1 inner Join |
| `SQLQuery1_joins.sql` | SQLQuery1 joins |
| `SQLQuery1_left_join.sql` | SQLQuery1 left join |
| `SQLQuery2_TABLE.sql` | SQLQuery2 TABLE |
| `SQLQuery2_inner_join.sql` | SQLQuery2 inner join |
| `SQLQuery2_right_join.sql` | SQLQuery2 right join |
| `SQLQuery2_search.sql` | SQLQuery2 search |
| `SQLQuery3.sql` | SQLQuery3 |
| `SQLQuery3_task_where.sql` | SQLQuery3 task where |
| `anti left join.sql` | anti left join |
| `cross_joins.sql` | cross joins |
| `full_anti_join.sql` | full anti join |
| `full_join.sql` | full join |
| `join_multiple_table.sql` | join multiple table |
| `task.sql` | task |

## Self-contained demo query
```sql
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    o.OrderId,
    o.OrderDate
FROM dbo.Customer AS c
INNER JOIN dbo.[Order] AS o
    ON o.CustomerId = c.CustomerId
WHERE o.OrderDate >= '2026-01-01';
```
Line-by-line:
1. Select explicit columns only (avoid `SELECT *`).
2. Customer is aliased as `c` and Order as `o` for readability.
3. `INNER JOIN` keeps only matching customer-order pairs.
4. Join predicate uses key relationship `o.CustomerId = c.CustomerId`.
5. Date filter narrows result set for better IO.

Expected result: only customers with orders on/after 2026-01-01.

## Common mistakes
- Missing join predicate -> Cartesian explosion.
- Filtering right table in `WHERE` after `LEFT JOIN` (turns into inner join).
- Joining on non-unique text columns.

## Performance + maintainability
- Index join keys (`CustomerId`).
- Keep predicates SARGable (`OrderDate >= constant`).
- Place complex logic in CTE/view for readability.

## DSA connection
Join algorithms mirror DSA strategies:
- Hash join -> hash table lookup behavior
- Merge join -> sorted merge (`O(n+m)` after sort)
- Nested loops -> repeated search behavior

## Exercises
1. Find customers with **no orders** using `LEFT JOIN` + `WHERE o.OrderId IS NULL`.
2. Compare `INNER JOIN` vs `EXISTS` for existence checks.
