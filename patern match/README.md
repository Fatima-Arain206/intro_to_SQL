# Pattern Matching

## Pattern matching in SQL

Pattern matching helps find text that follows a certain format.

## Main operators

### LIKE
```sql
SELECT FirstName
FROM dbo.Customer
WHERE FirstName LIKE 'A%';
```

### Contains
```sql
SELECT FirstName
FROM dbo.Customer
WHERE FirstName LIKE '%ali%';
```

### Single character wildcard
```sql
SELECT FirstName
FROM dbo.Customer
WHERE FirstName LIKE 'A_';
```

## Use cases

- search names
- filter emails
- match product codes
- clean data

## Best practices

- avoid leading wildcards when possible
- use normalized values for better matching
- index searchable columns when large data is involved

This folder contains pattern matching examples and queries.
