# Fuzzy Functions

This folder focuses on approximate matching and flexible text searching.

## Why fuzzy matching matters
Real-world data often contains typos, mixed casing, partial names, and formatting issues. Fuzzy matching helps when exact equality is not enough.

## Typical use cases
- customer name search
- partial matching
- approximate duplicates detection
- searching across messy text data

## Common concepts
- case-insensitive matching
- similarity checks
- wildcard patterns
- pattern matching with `LIKE`

## Example
```sql
SELECT
    CustomerId,
    FirstName,
    LastName
FROM dbo.Customer
WHERE FirstName LIKE 'A%';
```

## Best practice
Fuzzy logic should be used carefully. For performance-critical queries, targeted indexes and exact matching are usually better than broad fuzzy searches.

## Practice tasks
1. Search names with wildcards.
2. Compare exact and approximate matching.
3. Identify when fuzzy search is useful vs dangerous.

This folder helps you work with imperfect data in a practical and realistic way.
