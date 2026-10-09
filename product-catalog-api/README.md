# Product Catalog API Data Guide

This folder contains API-facing SQL configuration/assets for a product catalog scenario.

## Learning goals
- Map API fields to relational columns.
- Keep query contracts stable and explicit.
- Add filters/sorts safely.

## Typical API query pattern
```sql
SELECT
    p.ProductId,
    p.ProductName,
    p.UnitPrice,
    p.IsActive,
    c.CategoryName
FROM dbo.Product AS p
INNER JOIN dbo.Category AS c
    ON c.CategoryId = p.CategoryId
WHERE p.IsActive = 1
ORDER BY p.ProductName;
```
Line-by-line:
1. Explicit projection controls payload size.
2. Join enriches product row with category label.
3. Active filter hides retired products.
4. Stable ordering improves deterministic paging.

Expected result: active products sorted by name for API response.

## API best practices
- Parameterize user filters (`@CategoryId`, `@MinPrice`, ...).
- Avoid `SELECT *` to prevent accidental response drift.
- Ensure indexes support API filter/sort keys.
