# Fuzzy Functions

## What are fuzzy functions?

Fuzzy functions help when data is not exactly matched, but very similar.

Examples:
- `Ali` vs `Aly`
- `Khan` vs `Khanh`
- search by partial text

## Common patterns

### LIKE
```sql
SELECT FirstName
FROM dbo.Customer
WHERE FirstName LIKE 'A%';
```

### Contains search
```sql
SELECT FirstName
FROM dbo.Customer
WHERE FirstName LIKE '%ali%';
```

### CHARINDEX
```sql
SELECT FirstName, CHARINDEX('a', FirstName) AS Position
FROM dbo.Customer;
```

### PATINDEX
```sql
SELECT Email, PATINDEX('%@%', Email) AS AtPosition
FROM dbo.Customer;
```

## Why useful?

- search boxes
- name matching
- messy data cleanup
- data quality checks

## Best practices

- normalize values before comparing
- use `TRIM()` / `LOWER()` when needed
- avoid overly broad patterns

## Practice

1. Search names starting with `A`
2. Search names containing `ali`
3. Find emails with `@gmail.com`

This folder contains examples for fuzzy and flexible text matching in SQL.
