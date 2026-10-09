# Stored Procedures (Reusable Business Logic)

## Overview
Procedures encapsulate validated, parameterized T-SQL for application use.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `Procedure_output.sql` | Procedure output |
| `Procedure_para.sql` | Procedure para |
| `SQLQuery4.sql` | SQLQuery4 |
| `SQLQuery5.sql` | SQLQuery5 |
| `check.sql` | check |
| `error_handling.sql` | error handling |
| `function_table.sql` | function table |
| `outputprocedure.sql` | outputprocedure |
| `procedure_error_handling.sql` | procedure error handling |
| `procedure_first.sql` | procedure first |
| `std.sql` | std |
| `try_catch.sql` | try catch |

## Safe procedure template
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
    END CATCH;
END;
```
Line-by-line:
1. Procedure name follows `usp_ActionEntity` style.
2. Input parameter avoids query-string concatenation risk.
3. `SET NOCOUNT ON` reduces noisy rowcount messages.
4. `TRY...CATCH` centralizes error handling.
5. Explicit columns + schema-qualified table keep code stable.

Expected result: returns order rows for one customer safely.

## Common mistakes
- Dynamic SQL without sanitization.
- Missing transaction scope for multi-step writes.

## Best practices
- For writes, wrap `BEGIN TRAN` in `TRY` and rollback in `CATCH`.
- Surface consistent error metadata/logging.

## DSA connection
Think of a procedure like a reusable function with controlled inputs/outputs and side effects.

## Exercises
1. Build `dbo.usp_InsertOrderHeader` with transaction + validation.
2. Add optional date range parameters and test null-handling logic.
