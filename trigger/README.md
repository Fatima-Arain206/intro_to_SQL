# Trigger

## What is a trigger?

A trigger is a special type of procedure that automatically runs when data changes.

## Common trigger events

- `INSERT`
- `UPDATE`
- `DELETE`

## Example trigger

```sql
CREATE TRIGGER trg_AfterInsertCustomer
ON dbo.Customer
AFTER INSERT
AS
BEGIN
    SELECT 'New customer inserted' AS Message;
END;
```

## Why triggers matter

- audit changes
- maintain logs
- enforce business rules

## Best practices

- keep triggers simple
- avoid heavy logic
- test carefully
- don’t use triggers for business logic when a procedure is better

## Common mistakes

- writing slow logic in triggers
- recursive trigger loops
- not handling updates carefully

This folder contains SQL examples showing trigger behavior and usage.
