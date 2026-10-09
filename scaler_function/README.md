# Scalar & Table Functions

## Overview
This folder includes scalar UDF patterns, inline table-valued functions, and `CROSS APPLY` usage.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuery1.sql` | SQLQuery1 |
| `bussines_logic.sql` | bussines logic |
| `cross_apply.sql` | cross apply |
| `inline_table.sql` | inline table |
| `mulit_statment_function.sql` | mulit statment function |
| `multi_statment.sql` | multi statment |
| `tenure_scaler.sql` | tenure scaler |

## Example (inline TVF preferred for performance)
```sql
CREATE FUNCTION dbo.ufn_CustomerOrdersByYear (@OrderYear INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        o.OrderId,
        o.CustomerId,
        o.OrderDate,
        o.TotalAmount
    FROM dbo.[Order] AS o
    WHERE YEAR(o.OrderDate) = @OrderYear
);
```
Line-by-line:
1. Function parameter defines reusable filter criterion.
2. `RETURNS TABLE` inline form usually optimizes better than multi-statement UDF.
3. Explicit projection supports predictable contracts.

Expected result: function behaves like parameterized view for one year.

## Pitfalls
- Scalar UDF row-by-row overhead on big scans.
- Non-SARGable filters (`YEAR(column)`); consider persisted computed column/filter rewrite.

## DSA connection
`CROSS APPLY` resembles map/transform over each outer row.

## Exercises
1. Convert a scalar UDF to inline TVF and compare execution plans.
2. Use `CROSS APPLY` to parse delimited tags per product.
