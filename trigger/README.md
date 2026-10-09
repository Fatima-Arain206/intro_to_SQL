# Triggers (Event-driven Data Rules)

## Overview
Triggers automatically execute on table/view DML events.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `Log_table.sql` | Log table |
| `auditTable.sql` | auditTable |
| `conct.sql` | conct |
| `dml_trigger.sql` | dml trigger |
| `dml_trigger_verify.sql` | dml trigger verify |
| `history_table.sql` | history table |
| `instaed_of.sql` | instaed of |
| `labTask_view.sql` | labTask view |
| `proceudere_labTask.sql` | proceudere labTask |
| `scaller.sql` | scaller |
| `tiggerLAb.sql` | tiggerLAb |
| `trigger_onLogTAble.sql` | trigger onLogTAble |
| `trigger_verify.sql` | trigger verify |
| `triggier_after_insert.sql` | triggier after insert |
| `tvf_function.sql` | tvf function |
| `update_after_trigger.sql` | update after trigger |

## Example audit trigger
```sql
CREATE TRIGGER dbo.trg_Order_Audit
ON dbo.[Order]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.OrderAudit (
        OrderId,
        OldTotalAmount,
        NewTotalAmount,
        ChangedAt
    )
    SELECT
        d.OrderId,
        d.TotalAmount,
        i.TotalAmount,
        SYSUTCDATETIME()
    FROM inserted AS i
    INNER JOIN deleted AS d
        ON d.OrderId = i.OrderId;
END;
```
Line-by-line:
1. Trigger fires after updates on `dbo.[Order]`.
2. `inserted`/`deleted` pseudo-tables hold new/old row versions.
3. Join by PK maps before/after values.
4. Insert writes audit history with UTC timestamp.

Expected result: each updated order produces one audit row.

## Cautions
- Triggers run per statement, not per row.
- Avoid business logic that belongs in application/procedure layer.

## Performance & debugging
- Keep trigger body minimal and set-based.
- Inspect recursion/nesting settings when side effects chain.

## DSA connection
Trigger pipelines resemble event-driven systems with downstream processing edges.

## Exercises
1. Add delete-audit trigger with actor identity.
2. Write INSTEAD OF trigger for controlled soft-delete.
