# Fuzzy / Approximate Matching

## Overview
Use fuzzy-style matching when exact text equality is too strict.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQu.sql` | SQLQu |
| `SQLQuery.sql` | SQLQuery |
| `SQLQuery1.sql` | SQLQuery1 |
| `SQLQuery10.sql` | SQLQuery10 |
| `SQLQuery11.sql` | SQLQuery11 |
| `SQLQuery12.sql` | SQLQuery12 |
| `SQLQuery2.sql` | SQLQuery2 |
| `SQLQuery3.sql` | SQLQuery3 |
| `SQLQuery4.sql` | SQLQuery4 |
| `SQLQuery5.sql` | SQLQuery5 |
| `SQLQuery6.sql` | SQLQuery6 |
| `SQLQuery7.sql` | SQLQuery7 |
| `SQLQuery8.sql` | SQLQuery8 |
| `SQLQuery9.sql` | SQLQuery9 |

## Example (safe starter pattern)
```sql
SELECT
    c.CustomerId,
    c.FullName
FROM dbo.Customer AS c
WHERE c.FullName LIKE '%fatima%';
```
Line-by-line:
1. Select explicit identity + text column.
2. `LIKE` wildcard finds partial matches.
3. Works for quick search prototypes.

Expected result: rows containing the substring `fatima`.

## Caveats
- `%term%` cannot seek regular B-tree index efficiently.
- Collation affects case/accent matching behavior.

## Better options for scale
- Full-text search
- Phonetic helpers (`SOUNDEX`, `DIFFERENCE`) where relevant
- Pre-normalized search keys

## DSA connection
Approximate matching relates to string similarity/search structures and heuristic scoring.

## Exercises
1. Compare `LIKE`, `SOUNDEX`, and exact match outputs.
2. Create normalized search column and benchmark.
