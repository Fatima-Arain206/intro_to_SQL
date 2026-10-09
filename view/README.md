# Views (Reusable Query Interfaces)

## Overview
Views present curated table data to consumers without exposing full base-table complexity.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `calculated_verfiy.sql` | calculated verfiy |
| `calculated_view.sql` | calculated view |
| `check.sql` | check |
| `check_viwe.sql` | check viwe |
| `first_view.sql` | first view |
| `intro_index.sql` | intro index |
| `view1JosnPath.sql` | view1JosnPath |
| `view_afterInsert.sql` | view afterInsert |
| `view_by_mcp_server.sql` | view by mcp server |
| `view_with_check_option.sql` | view with check option |

## Example with safety options
```sql
CREATE VIEW dbo.vw_ActiveCustomer
AS
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.IsActive
FROM dbo.Customer AS c
WHERE c.IsActive = 1;
```
Line-by-line:
1. `vw_` naming conveys read model purpose.
2. Explicit columns define stable contract.
3. Filtered condition bakes reusable business rule.

Expected result: selecting from the view returns active customers only.

## Advanced notes
- `WITH SCHEMABINDING` protects referenced schema changes.
- `WITH CHECK OPTION` enforces view filter on updates.

## Pitfalls
- Treating views as performance silver bullets.
- Nesting too many views and losing plan clarity.

## DSA connection
A view is like an abstraction layer/API over underlying data structures.

## Exercises
1. Create a revenue summary view grouped by month.
2. Add check option to a filtered updatable view and test invalid insert.
