# Scalar Function (scaler_function) — Value-by-Value Logic

## Purpose
Scalar UDFs return one value per invocation, useful for reusable transformation rules.

## Prerequisites/objectives
- Understand expression logic and determinism.
- Learn scalar UDF trade-offs vs inline expressions.

## Example
```sql
CREATE OR ALTER FUNCTION dbo.ufn_NormalizePhone
(
    @RawPhone NVARCHAR(50)
)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @CleanPhone NVARCHAR(50);

    SET @CleanPhone = REPLACE(REPLACE(REPLACE(@RawPhone, N'-', N''), N' ', N''), N'(', N'');
    SET @CleanPhone = REPLACE(@CleanPhone, N')', N'');

    RETURN @CleanPhone;
END;
```
Line-by-line:
- Input parameter holds raw text.
- Nested `REPLACE` strips punctuation.
- Function returns normalized value.

## Usage query
```sql
SELECT
    c.CustomerID,
    dbo.ufn_NormalizePhone(c.PhoneNumber) AS CleanPhone
FROM dbo.Customer AS c;
```

## NULL/edge/performance
- If input is NULL, replacements return NULL.
- Scalar UDFs can hurt performance row-by-row on large sets (depending on inlining support).

## Security/maintainability
- Keep UDF deterministic where possible.
- Avoid side effects; UDF should be pure transformation.

## Exercises
1. Build UDF for email normalization.
2. Compare UDF vs inline expression performance.
3. Add computed column using UDF and evaluate indexing impact.

## Navigation
Previous: [PDFs](../PDFs/README.md)  
Next: [string functions](../string_functions/README.md)
