# check.sql Folder Guide

## Overview
This folder contains validation-oriented SQL scripts and supporting objects.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `check.sql` | check |
| `tables.sql` | tables |
| `vw_ProductSalesAnalysis.sql` | vw ProductSalesAnalysis |

## Suggested usage
- Run table/view creation scripts first.
- Execute check scripts to confirm expected shape/results.
- Compare output after each modification.

## Example verification query
```sql
SELECT
    ps.ProductId,
    ps.TotalSalesAmount
FROM dbo.vw_ProductSalesAnalysis AS ps
WHERE ps.TotalSalesAmount > 0;
```
Line-by-line:
1. Reads from analysis view only required columns.
2. Filter removes empty/invalid totals.

Expected result: positive-sales products with stable metrics.

## Common mistakes
- Running verification before base objects exist.
- Ignoring datatype mismatches between source and view calculations.
