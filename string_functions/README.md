# String Functions (Data Cleaning Toolkit)

## Overview
This folder practices text normalization and parsing operations.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `REPLACE.sql` | REPLACE |
| `SQLQuery2.sql` | SQLQuery2 |
| `TRIM.sql` | TRIM |
| `concat.sql` | concat |

## Self-contained demo
```sql
SELECT
    c.CustomerId,
    TRIM(c.FullName) AS CleanName,
    UPPER(c.CountryCode) AS CountryCodeUpper,
    REPLACE(c.PhoneNumber, '-', '') AS PhoneDigits
FROM dbo.Customer AS c;
```
Line-by-line:
1. `TRIM` removes leading/trailing spaces.
2. `UPPER` standardizes case for comparisons.
3. `REPLACE` strips punctuation from phone values.
4. Explicit columns keep output predictable.

Expected result: cleaner values for matching and analytics.

## Common mistakes
- Assuming text comparison is case-sensitive in every collation.
- Using `%pattern%` search on large tables without strategy.

## Performance notes
- Avoid wrapping indexed predicates in functions when possible.
- For search-heavy workloads, consider full-text indexing.

## DSA connection
Tokenization and normalization resemble preprocessing in search pipelines.

## Exercises
1. Parse email domain using `CHARINDEX` and `SUBSTRING`.
2. Identify duplicate customers after normalization.
