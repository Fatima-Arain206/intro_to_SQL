# Product Catalog API

This folder likely contains practical database and API examples built around a product catalog dataset.

## Aim
The goal is to connect SQL concepts to a realistic business domain where products, categories, pricing, and inventory are stored and queried.

## Core concepts likely used here
- table design for products
- catalog data relationships
- joins between product and category tables
- filtering by category, price, or stock
- stored procedures for API-like data access

## Example workflow
```sql
SELECT
    p.ProductId,
    p.ProductName,
    c.CategoryName,
    p.UnitPrice
FROM dbo.Product AS p
INNER JOIN dbo.Category AS c
    ON p.CategoryId = c.CategoryId;
```

## Skills to practice
1. Design a catalog schema.
2. Write queries for products by category.
3. Add filters for price and availability.
4. Build API-friendly data access patterns.

This folder is a bridge between pure SQL learning and real business application design.
