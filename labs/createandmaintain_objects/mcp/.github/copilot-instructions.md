# Copilot Instructions for `labs/createandmaintain_objects/mcp`

## Purpose
This subfolder is used for object-creation/maintenance labs. Guidance here keeps generated SQL aligned with repository standards.

## Required SQL conventions
- Use explicit column lists (`SELECT *` avoid).
- Always schema-qualify (`dbo.TableName`).
- Use ANSI JOIN syntax.
- Use `SET NOCOUNT ON` in procedures.
- Wrap data modifications in `TRY...CATCH`.
- Prefer parameterized patterns; no unsafe concatenation.

## Lab-output checklist
1. Naming follows project conventions.
2. DDL contains keys/constraints with clear names.
3. DML examples include expected output interpretation.
4. Error cases are demonstrated (FK fail, CHECK fail, duplicate key).
5. Performance hint is included (index suggestion + plan expectation).

## Quick template
```sql
CREATE OR ALTER PROCEDURE dbo.usp_LabTemplate
    @EntityID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT
            e.EntityID,
            e.EntityName
        FROM dbo.Entity AS e
        WHERE e.EntityID = @EntityID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
```

## Navigation
Previous: [labs main](../../../README.md)  
Next: [root guidelines](../../../../.github/copilot-instructions.md)
