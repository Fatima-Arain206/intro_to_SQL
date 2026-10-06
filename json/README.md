# JSON in SQL Server

This folder covers working with JSON data inside SQL Server tables and queries.

## Why JSON matters
Many systems send and receive JSON from APIs, front-end apps, and services. SQL Server can store and query JSON efficiently.

## Core topics
- JSON columns
- `OPENJSON`
- `JSON_VALUE`
- `JSON_MODIFY`
- parsing semi-structured data

## Example
```sql
SELECT
    JSON_VALUE(CustomerData, '$.name') AS CustomerName,
    JSON_VALUE(CustomerData, '$.city') AS City
FROM dbo.CustomerProfile;
```

## Learning goals
- Understand when JSON is a good fit
- Learn how to convert JSON to relational rows
- Learn how to update JSON values without rewriting the entire document

## Best practices
- Use JSON when data is semi-structured
- Use relational tables for structured, strongly typed data
- Validate JSON before storing large payloads
- Keep queries readable and explicit

## Practice tasks
1. Parse JSON arrays with `OPENJSON`.
2. Extract a scalar value with `JSON_VALUE`.
3. Update a key using `JSON_MODIFY`.
4. Compare JSON storage to a normalized table design.

This folder teaches how SQL Server bridges the gap between relational and document-style data.
