# Pattern Matching in T-SQL

## Overview
Pattern matching is essential for validation, search, and data-quality checks.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuery2.sql` | SQLQuery2 |
| `SQLQuery6.sql` | SQLQuery6 |
| `count.sql` | count |
| `cross_ap.sql` | cross ap |
| `flag.sql` | flag |
| `matxh.sql` | matxh |
| `replace.sql` | replace |
| `replace_reges.sql` | replace reges |
| `split.sql` | split |
| `substring.sql` | substring |

## Example
```sql
SELECT
    p.ProductCode,
    p.ProductName
FROM dbo.Product AS p
WHERE p.ProductCode LIKE '[A-Z][A-Z][0-9][0-9][0-9]';
```
Line-by-line:
1. Pull code + name for readable diagnostics.
2. Bracket pattern enforces 2 letters + 3 digits format.

Expected result: only products that match required code pattern.

## Common mistakes
- Forgetting escape rules for `%` or `_` literals.
- Using pattern checks without trimming dirty input.

## Performance tips
- Prefix patterns like `ABC%` can use index seeks.
- Leading wildcard `%ABC` usually forces scan.

## DSA connection
Pattern parsing resembles finite-state matching (character-by-character transitions).

## Exercises
1. Validate email-like format using `LIKE` + additional checks.
2. Split a delimited tag column and search one token.
