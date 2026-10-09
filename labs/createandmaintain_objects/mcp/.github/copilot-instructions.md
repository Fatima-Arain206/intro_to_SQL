# MCP Lab Copilot Instructions (Stored Procedure Focus)

This lab area focuses on create/maintain database objects with safe stored procedure patterns.

## Procedure template requirements
- Name pattern: `dbo.usp_ActionEntity`
- Start with `SET NOCOUNT ON`
- Use `TRY...CATCH`
- Use explicit transaction for data modifications
- Use explicit columns and `dbo.` schema

## Reference template
```sql
CREATE PROCEDURE dbo.usp_ExampleProcedure
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Procedure logic

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH;
END;
```

## Debugging checklist
1. Did transaction always end (commit/rollback)?
2. Are errors surfaced with useful context?
3. Are all object names schema-qualified?
