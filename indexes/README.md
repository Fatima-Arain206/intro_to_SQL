# Indexes (Performance Engineering Basics)

## Overview
Indexes reduce lookup cost and improve join/sort/filter performance when designed well.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuer.sql` | SQLQuer |
| `SQLQuery1.sql` | SQLQuery1 |
| `compositeIndex.sql` | compositeIndex |
| `createIndex.sql` | createIndex |
| `dropIndex.sql` | dropIndex |
| `heap_table.sql` | heap table |
| `nonclustred.sql` | nonclustred |
| `tables.sql` | tables |
| `useOf Index.sql` | useOf Index |

## Example
```sql
CREATE NONCLUSTERED INDEX IX_Order_CustomerId_OrderDate
ON dbo.[Order] (CustomerId, OrderDate)
INCLUDE (TotalAmount);
```
Line-by-line:
1. Nonclustered index keys support seek on customer/date predicates.
2. Include column avoids extra key lookups for amount projections.

Expected result: lower logical reads for common customer timeline queries.

## Common mistakes
- Creating too many overlapping indexes.
- Ignoring write overhead on heavy insert/update tables.

## Performance workflow
1. Baseline query stats (`SET STATISTICS IO, TIME ON`).
2. Add/change one index.
3. Re-test and compare plans/reads.

## DSA connection
Most relational indexes are tree-based; seek is `O(log n)` while scans are `O(n)`.

## Exercises
1. Design covering index for top-10 recent orders per customer.
2. Compare heap vs clustered table read behavior.
