# Intro to SQL (SQL Server / T-SQL) Learning Map

Welcome! This repository is organized as topic-wise practice folders so you can move from beginner SQL to advanced SQL Server patterns.

## How to Use This Repo
1. Start with `PDFs/` for theory.
2. Move to folder READMEs for hands-on steps.
3. Run `.sql` files in a safe practice database.
4. For each topic: predict output -> run query -> explain result.

```mermaid
flowchart LR
A[Theory PDFs] --> B[Topic README]
B --> C[Run SQL Script]
C --> D[Check Output]
D --> E[Tune, Secure, Refactor]
```

## Topic Navigation
| Topic | Folder | Start here |
|---|---|---|
| Core table design | `TABLE/` | [TABLE/README.md](TABLE/README.md) |
| Joins | `Joins/` | [Joins/README.md](Joins/README.md) |
| CTEs | `cte/` | [cte/README.md](cte/README.md) |
| Subqueries | `subquery/` | [subquery/README.md](subquery/README.md) |
| Set operators | `sets/` | [sets/README.md](sets/README.md) |
| String functions | `string_functions/` | [string_functions/README.md](string_functions/README.md) |
| Window functions | `windows_function/` | [windows_function/README.md](windows_function/README.md) |
| Procedures | `procedure/` | [procedure/README.md](procedure/README.md) |
| Scalar/table functions | `scaler_function/` | [scaler_function/README.md](scaler_function/README.md) |
| Views | `view/` | [view/README.md](view/README.md) |
| Triggers | `trigger/` | [trigger/README.md](trigger/README.md) |
| Indexes | `indexes/` | [indexes/README.md](indexes/README.md) |
| JSON | `json/` | [json/README.md](json/README.md) |
| Security | `security/` | [security/README.md](security/README.md) |
| Fuzzy matching | `fuzzy_functions/` | [fuzzy_functions/README.md](fuzzy_functions/README.md) |
| Pattern matching | `patern match/` | [patern match/README.md](patern%20match/README.md) |
| Graph/Node patterns | `node/` | [node/README.md](node/README.md) |
| Vector search concepts | `vectors/` | [vectors/README.md](vectors/README.md) |
| Labs | `labs/` | [labs/README.md](labs/README.md) |
| DSA for DB internals | `DSA/` | [DSA/README.md](DSA/README.md) |
| PDF learning track | `PDFs/` | [PDFs/README.md](PDFs/README.md) |

## T-SQL Conventions Used Across This Repo
- Explicit column list in `SELECT` statements
- `dbo.` schema qualification
- ANSI joins (`INNER JOIN`, `LEFT JOIN`)
- Parameterization over string concatenation
- `TRY...CATCH` for data modifications

## Quick self-check questions
- Can I explain why this query returns each row?
- Can I predict what happens for `NULL`, duplicates, and empty sets?
- Which index would support this predicate/order?
- Is this query safe and maintainable in production?
