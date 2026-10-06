# String Functions

This folder covers string manipulation in SQL Server, which is essential for cleaning, transforming, and validating textual data.

## Topics covered
- `CONCAT`
- `REPLACE`
- `TRIM`
- `SUBSTRING`
- `LEN`
- `LOWER`, `UPPER`
- `LEFT`, `RIGHT`
- `CHARINDEX`, `PATINDEX`

## Why string functions matter
In real-world datasets, names, addresses, products, and codes often contain inconsistent formatting. SQL string functions help you standardize data.

## Example
```sql
SELECT
    CONCAT(FirstName, ' ', LastName) AS FullName,
    TRIM(Email) AS CleanEmail,
    REPLACE(PhoneNumber, '-', '') AS CleanPhone
FROM dbo.Customer;
```

## Best practices
- Trim user input before storing or comparing it
- Normalize case consistently
- Be careful with `NULL` values
- Use functions only when necessary; index-friendly patterns are better for large datasets

## Practice tasks
1. Remove leading/trailing spaces.
2. Replace unwanted characters.
3. Extract first names from full names.
4. Build full names using `CONCAT`.

## DSA learning connection
String manipulation is related to pattern matching and text processing. It strengthens your understanding of indexing, substring logic, and algorithmic efficiency in data operations.
