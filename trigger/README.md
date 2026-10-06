# Triggers

This folder covers database triggers, which fire automatically in response to data changes.

## What triggers are
Triggers execute after or instead of DML events such as `INSERT`, `UPDATE`, or `DELETE`.

## Common use cases
- auditing changes
- enforcing business rules
- maintaining summary tables
- automatically updating related records

## Example
```sql
CREATE TRIGGER dbo.trg_OrderAudit
ON dbo.[Order]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.OrderAuditLog (OrderId, ActionType, AuditDate)
    SELECT i.OrderId, 'INSERT_OR_UPDATE', SYSUTCDATETIME()
    FROM inserted AS i;
END;
```

## Important caution
Triggers are powerful but can cause hidden side effects. They should be used carefully because they can:
- reduce performance
- create unexpected update chains
- make debugging harder

## Best practices
- Keep trigger logic simple
- Prefer application-level checks when possible
- Avoid long-running processing in triggers
- Use `inserted` and `deleted` tables carefully

## Practice tasks
1. Create a trigger that logs changes.
2. Understand the difference between `inserted` and `deleted`.
3. Test update and delete operations.
4. Explain when triggers are a good vs bad choice.

This folder helps you understand event-driven SQL logic and database auditing.
