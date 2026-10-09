# Security (Least Privilege + Data Protection)

## Overview
This folder covers SQL Server security features: permissions, masking, encryption, row-level security, and auditing.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `aaaaaa.sql` | aaaaaa |
| `aaudit.sql` | aaudit |
| `cek.sql` | cek |
| `cmk.sql` | cmk |
| `col_level_e.sql` | col level e |
| `decrypt.sql` | decrypt |
| `encrpyt_table.sql` | encrpyt table |
| `encrypt.sql` | encrypt |
| `func.sql` | func |
| `grant.sql` | grant |
| `intro.sql` | intro |
| `mask.sql` | mask |
| `predicted.sql` | predicted |
| `rls_fun.sql` | rls fun |
| `security.sql` | security |
| `security_policy.sql` | security policy |
| `seq.sql` | seq |
| `ser.sql` | ser |

## Learning objectives
- Apply least privilege.
- Protect sensitive data at rest and in query output.
- Enforce row-level policies by user context.

## Example: secure read via procedure
```sql
CREATE PROCEDURE dbo.usp_GetCustomerContact
    @CustomerId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.CustomerId,
        c.FirstName,
        c.LastName,
        c.EmailAddress
    FROM dbo.Customer AS c
    WHERE c.CustomerId = @CustomerId;
END;
```
Line-by-line:
1. Caller passes parameterized key (safe input handling).
2. Procedure exposes only required columns.
3. No direct table grant needed for app role if execute rights are used.

Expected result: controlled row/column exposure.

## Security reminders
- Never `GRANT` to `public`.
- Avoid dynamic SQL unless strictly necessary.
- Use `TRY...CATCH` around sensitive write operations.

## DSA connection
Security policies on predicates resemble filtered graph traversal: user context determines reachable nodes (rows).

## Exercises
1. Implement dynamic data masking for email.
2. Create row-level security predicate function and policy.
