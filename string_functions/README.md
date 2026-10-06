# String Functions

## String manipulation in SQL

SQL string functions help transform and analyze text.

## Common examples

### CONCAT
```sql
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM dbo.Customer;
```

### REPLACE
```sql
SELECT REPLACE(Email, 'gmail.com', 'outlook.com')
FROM dbo.Customer;
```

### TRIM
```sql
SELECT TRIM(FirstName)
FROM dbo.Customer;
```

### LEN
```sql
SELECT FirstName, LEN(FirstName) AS NameLength
FROM dbo.Customer;
```

## Why important?

- fix messy data
- format output
- clean search values
- prepare data for reports

## Best practices

- trim spaces before comparisons
- normalize to lowercase when needed
- test the result before updating production data

This folder contains examples of string functions in SQL Server.
