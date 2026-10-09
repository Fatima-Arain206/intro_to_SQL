# String Functions — Clean and Transform Text Data

## Purpose
Text cleanup is essential for search, deduplication, reporting, and integrations.

## Prerequisites/objectives
- Basic SELECT/UPDATE knowledge.
- Learn `LEN`, `LTRIM/RTRIM/TRIM`, `SUBSTRING`, `REPLACE`, `CHARINDEX`.

## Mental model
Think of strings as arrays of characters with 1-based indexing in SQL Server functions.

## Demo table
```sql
CREATE TABLE dbo.CustomerText
(
    CustomerID INT NOT NULL,
    RawName NVARCHAR(200) NOT NULL,
    RawEmail NVARCHAR(255) NULL,
    CONSTRAINT PK_CustomerText PRIMARY KEY (CustomerID)
);
```

## Examples
### Normalize name and domain extraction
```sql
SELECT
    ct.CustomerID,
    TRIM(ct.RawName) AS CleanName,
    LOWER(ct.RawEmail) AS NormalizedEmail,
    SUBSTRING(
        ct.RawEmail,
        CHARINDEX(N'@', ct.RawEmail) + 1,
        LEN(ct.RawEmail)
    ) AS EmailDomain
FROM dbo.CustomerText AS ct;
```
Line-by-line:
- `TRIM` removes leading/trailing spaces.
- `LOWER` standardizes case for comparisons.
- `CHARINDEX` locates `@`.
- `SUBSTRING` extracts domain portion.

Expected output: cleaned name, normalized email, domain.

### Safe update in procedure style
```sql
CREATE OR ALTER PROCEDURE dbo.usp_NormalizeCustomerText
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE dbo.CustomerText
        SET
            RawName = TRIM(RawName),
            RawEmail = LOWER(RawEmail);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
```

## NULL/edge cases
- `LOWER(NULL)` returns NULL.
- Missing `@` yields `CHARINDEX = 0`; handle with CASE when needed.

## Performance
- Expressions on columns can disable index seeks.
- Consider computed persisted columns for searchable normalized values.

## Security/maintainability
- Validate text length and format before dynamic usage.
- Prefer deterministic cleanup rules documented in one place.

## Debugging
- Wrong domain extraction? inspect rows without `@`.
- Truncation risk? compare destination column lengths.

## Exercises
1. Beginner: remove double spaces from names.
2. Intermediate: derive first/last name split.
3. Advanced: build reusable normalization view and compare plan.

DSA link: string normalization is similar to preprocessing before hash-key matching.

## Navigation
Previous: [sets](../sets/README.md)  
Next: [pattern match](../patern%20match/README.md)
