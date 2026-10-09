# Window Functions (Analytics Without Collapsing Rows)

## Overview
Window functions compute analytics per row while preserving row-level detail.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuery10.sql` | SQLQuery10 |
| `cte_windowes.sql` | cte windowes |
| `dense_rank.sql` | dense rank |
| `first_last_value.sql` | first last value |
| `json_rute.sql` | json rute |
| `lag_lead.sql` | lag lead |
| `ntle.sql` | ntle |
| `partiionbyorderby.sql` | partiionbyorderby |
| `partition_andGrp.sql` | partition andGrp |
| `proceeding_row.sql` | proceeding row |
| `rank.sql` | rank |
| `row_num.sql` | row num |
| `window_agg_fun.sql` | window agg fun |

## Example
```sql
SELECT
    o.OrderId,
    o.CustomerId,
    o.OrderDate,
    o.TotalAmount,
    ROW_NUMBER() OVER (PARTITION BY o.CustomerId ORDER BY o.OrderDate DESC) AS RecencyRank,
    SUM(o.TotalAmount) OVER (PARTITION BY o.CustomerId) AS CustomerLifetimeAmount
FROM dbo.[Order] AS o;
```
Line-by-line:
1. Base columns keep raw transaction detail.
2. `ROW_NUMBER` ranks each customer's orders newest->oldest.
3. `SUM ... OVER` adds per-customer total beside each row.

Expected result: each order row enriched with rank + lifetime metric.

## Mistakes
- Missing `ORDER BY` in ranking windows.
- Large window spills due to memory grant pressure.

## Performance & maintenance
- Index by partition/order keys (`CustomerId`, `OrderDate`).
- Reuse window definitions when possible for readability.

## DSA connection
Window ordering uses sorting concepts; ranking complexity depends on sort/worktable behavior.

## Exercises
1. Compute 3-order moving average per customer.
2. Return latest order only using `ROW_NUMBER() = 1`.
