# Pattern Matching

This folder is about searching text using SQL pattern logic.

## Main tools
- `LIKE`
- `%` wildcard
- `_` wildcard
- `PATINDEX`

## Example
```sql
SELECT
    ProductName
FROM dbo.Product
WHERE ProductName LIKE '%Laptop%';
```

## Why it matters
Pattern matching is used for:
- searching names and keywords
- filtering classification codes
- identifying formatting mistakes
- handling partial text matches

## Practice tasks
1. Find records with a prefix or suffix.
2. Search for a pattern in a column.
3. Compare `LIKE` with equality checks.
4. Learn when to avoid pattern matching on large text columns.

This folder develops string-search thinking, which is essential for data cleaning and investigation.
