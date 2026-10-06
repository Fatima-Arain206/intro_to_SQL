# JSON

## What is JSON in SQL Server?

JSON is a lightweight format used to send and store data between systems.

SQL Server can:
- store JSON strings
- query JSON values
- generate JSON output
- parse arrays and nested objects

## Important functions

### JSON_VALUE
```sql
DECLARE @json NVARCHAR(MAX) = '{"CustomerId":1,"Name":"Ali"}';
SELECT JSON_VALUE(@json, '$.Name') AS Name;
```

### OPENJSON
```sql
DECLARE @json NVARCHAR(MAX) = '{"CustomerId":1,"Name":"Ali"}';
SELECT *
FROM OPENJSON(@json);
```

### FOR JSON
```sql
SELECT CustomerId, FirstName, LastName
FROM dbo.Customer
FOR JSON PATH;
```

## Example JSON document

```json
{
  "CustomerId": 1,
  "FirstName": "Ali",
  "Orders": [
    { "OrderId": 101, "Total": 200 },
    { "OrderId": 102, "Total": 300 }
  ]
}
```

## Why it matters

- API responses
- frontend/backend data exchange
- semi-structured data
- modern app integrations

## Best practices

- validate JSON before use
- keep schema simple
- use JSON only when it is useful

This folder includes examples for working with JSON in SQL Server.
