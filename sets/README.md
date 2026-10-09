# Set Operations (`UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT`)

## Overview
Set operators combine compatible result sets without explicit joins.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuery3.sql` | SQLQuery3 |
| `UNION_ALL.sql` | UNION ALL |
| `intersect.sql` | intersect |
| `order_of_qury.sql` | order of qury |
| `rule5.sql` | rule5 |
| `set_intro.sql` | set intro |
| `union.sql` | union |
| `union1.sql` | union1 |
| `union_rule.sql` | union rule |

## Example
```sql
SELECT
    c.CustomerId,
    c.EmailAddress
FROM dbo.Customer AS c
UNION
SELECT
    l.CustomerId,
    l.EmailAddress
FROM dbo.Lead AS l;
```
Line-by-line:
1. First query returns customer contacts.
2. Second query returns lead contacts with same column order/types.
3. `UNION` removes duplicates (distinct behavior).

Expected result: unified unique contact list.

## When to use what
- `UNION`: combine + deduplicate.
- `UNION ALL`: combine and keep duplicates (faster).
- `INTERSECT`: common rows.
- `EXCEPT`: rows in first set not present in second.

## Pitfalls
- Datatype mismatch across branches.
- Hidden sort/hash cost from duplicate removal in `UNION`.

## DSA connection
Set operators map to mathematical set operations and hash/sort dedup strategies.

## Exercises
1. Compare execution plans of `UNION` vs `UNION ALL`.
2. Use `EXCEPT` to detect missing product codes between environments.
