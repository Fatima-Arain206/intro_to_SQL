# Stored Procedures

This folder focuses on reusable SQL logic encapsulated in procedures.

## What a stored procedure is
A stored procedure is a named block of T-SQL that can accept input parameters, execute logic, and return result sets.

## Why procedures are useful
- centralize business logic
- improve maintainability
- reduce duplicate SQL over many applications
- control permissions and access patterns
- support transaction-safe operations

## Naming convention in this repo
- `usp_ActionEntity` such as `usp_GetCustomerOrders`

## Example
```sql
CREATE PROCEDURE dbo.usp_GetCustomerOrders
    @CustomerId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT
            o.OrderId,
            o.OrderDate,
            o.TotalAmount
        FROM dbo.[Order] AS o
        WHERE o.CustomerId = @CustomerId;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
```

## Important SQL Server practices
- Use `SET NOCOUNT ON`
- Wrap data changes in `TRY...CATCH`
- Use parameterized input
- Return explicit results, not generic messages only

## Practice tasks
1. Create a procedure to fetch one customer.
2. Create a procedure to insert a new order with validation.
3. Add `TRY...CATCH` and inspect error handling.
4. Compare procedure logic with inline SQL.

This folder helps you move from writing one-off scripts to building reusable database logic.
