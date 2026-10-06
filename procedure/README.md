# Procedure

## SQL stored procedures

A stored procedure is a reusable SQL block that can accept parameters and return results.

## Why use procedures?

- reusable logic
- cleaner code
- easier maintenance
- central business rules

## Basic syntax

```sql
CREATE PROCEDURE dbo.GetCustomerById
    @CustomerId INT
AS
BEGIN
    SELECT CustomerId, FirstName, LastName
    FROM dbo.Customer
    WHERE CustomerId = @CustomerId;
END;
```

## With output parameter

```sql
CREATE PROCEDURE dbo.GetCustomerCount
    @Total INT OUTPUT
AS
BEGIN
    SELECT @Total = COUNT(*)
    FROM dbo.Customer;
END;
```

## Error handling

```sql
BEGIN TRY
    SELECT 1 / 0;
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
```

## Best practices

- use clear procedure names
- pass parameters explicitly
- keep SQL readable
- handle errors properly

This folder covers procedure creation, parameters, and error handling in SQL Server.
