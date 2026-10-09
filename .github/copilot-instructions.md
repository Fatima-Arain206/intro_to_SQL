# Project Guidelines for Copilot

## Database Development Standards
This repository uses SQL Server 2025-oriented teaching examples.

## Naming Conventions
- Tables: PascalCase, singular (`Customer`, `OrderDetail`)
- Columns: PascalCase (`FirstName`, `OrderDate`)
- Stored procedures: `usp_ActionEntity` (`usp_GetCustomerOrders`)
- Views: `vw_EntityName` (`vw_ActiveCustomers`)
- Indexes: `IX_TableName_ColumnName`

## T-SQL Style (mandatory)
- Always use explicit column lists in `SELECT` statements.
- Always use schema-qualified names (`dbo.TableName`).
- Use ANSI JOIN syntax.
- Include error handling in stored procedures.
- Use `TRY...CATCH` for data modification workflows.
- Use readable formatting with one column per line in learning examples.

## Security Requirements
- Never generate `GRANT` statements to `public`.
- Use parameterized query patterns.
- Avoid dynamic SQL unless there is no cleaner alternative.

## Performance Guidelines
- Suggest indexes alongside table/query guidance.
- Use `SET NOCOUNT ON` in procedures.
- Prefer `EXISTS` over `COUNT(*)` for existence checks.
- Prefer sargable predicates (avoid wrapping indexed columns in functions when filtering).

## Documentation Requirements
For topic guides:
- Include purpose, prerequisites, mental model, visuals, progressive examples.
- Explain key query logic line-by-line.
- Document expected outputs, NULL behavior, edge cases, and debugging flow.
- Include realistic business use case and practical exercises.
