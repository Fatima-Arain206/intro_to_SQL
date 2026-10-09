# Project Guidelines for Copilot (Expanded)

This repository teaches SQL Server/T-SQL from beginner to advanced level. Keep generated code educational, safe, and production-aware.

## Core conventions
- Tables: PascalCase singular (`Customer`, `OrderDetail`)
- Columns: PascalCase (`FirstName`, `OrderDate`)
- Procedures: `usp_ActionEntity`
- Views: `vw_EntityName`
- Indexes: `IX_TableName_ColumnName`

## T-SQL quality rules
- Use explicit columns (no `SELECT *`).
- Use schema-qualified names (`dbo.TableName`).
- Use ANSI joins only.
- Add `SET NOCOUNT ON` in procedures.
- Use `TRY...CATCH` for data modifications.

## Security rules
- Never grant to `public`.
- Use parameterized inputs.
- Avoid dynamic SQL unless required and sanitized.

## Teaching style requirement
When generating docs/examples:
1. Give a simple overview.
2. Show runnable SQL.
3. Explain key lines.
4. Describe expected result.
5. Add common mistakes + debugging hint.
6. Mention performance/security impact.
