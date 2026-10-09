# JSON in SQL Server

## Overview
This folder practices reading, shaping, and updating JSON using T-SQL.

## Folder SQL map
| SQL file | Practice focus |
|---|---|
| `SQLQuery1.sql` | SQLQuery1 |
| `SQLQuery8.sql` | SQLQuery8 |
| `arrayAgg.sql` | arrayAgg |
| `configuration.sql` | configuration |
| `croos_apply_with_jso.sql` | croos apply with jso |
| `declareJson.sql` | declareJson |
| `join.sql` | join |
| `json_array.sql` | json array |
| `json_array2.sql` | json array2 |
| `json_object.sql` | json object |
| `json_qury.sql` | json qury |
| `nesnted_jsonpath.sql` | nesnted jsonpath |
| `open_json.sql` | open json |
| `scaler_val.sql` | scaler val |
| `ver.sql` | ver |

## Example
```sql
SELECT
    p.ProductId,
    JSON_VALUE(p.AttributesJson, '$.category') AS Category,
    JSON_VALUE(p.AttributesJson, '$.color') AS Color
FROM dbo.Product AS p
WHERE JSON_VALUE(p.AttributesJson, '$.isActive') = 'true';
```
Line-by-line:
1. `JSON_VALUE` extracts scalar properties.
2. Explicit aliases produce readable output.
3. Predicate filters active products from JSON payload.

Expected result: products with parsed category/color for active items.

## Important topics
- `OPENJSON` for arrays/object shredding
- `JSON_QUERY` for object/array fragments
- `JSON_MODIFY` for updates

## Pitfalls
- Invalid JSON text (use `ISJSON`).
- Function predicates can be non-SARGable at scale.

## DSA connection
JSON path navigation is similar to tree traversal over nested nodes.

## Exercises
1. Parse an order-items array with `OPENJSON` + `CROSS APPLY`.
2. Add persisted computed column for a frequently filtered JSON key.
