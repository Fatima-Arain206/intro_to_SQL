# Views

This folder explains virtual tables created from queries.

## What a view is
A view is a saved SELECT query that behaves like a table. It does not store data by itself, but it provides a reusable logical representation of the data.

## Why views are useful
- Simplify complex queries
- Hide table complexity from users
- Apply consistent business logic
- Restrict access to sensitive columns

## Common view scenarios
- simple data access views
- calculated columns
- filtered views
- `WITH SCHEMABINDING`
- `WITH CHECK OPTION` for safe updates

## Example
```sql
CREATE VIEW dbo.vw_ActiveCustomers AS
SELECT
    CustomerId,
    FirstName,
    LastName,
    Email
FROM dbo.Customer
WHERE IsActive = 1;
```

## Important design points
- Use clear names like `vw_EntityName`
- Keep views simple and readable
- Avoid hiding heavy logic inside overly complex views
- Use `WITH CHECK OPTION` when updates should remain valid according to the view filter

## Practice tasks
1. Create a view for active records.
2. Create a calculated view using `CASE` or aggregation.
3. Test whether inserts and updates are allowed from the view.
4. Compare view behavior to a physical table.

This folder teaches a very important database concept: data can be represented in a clean, reusable layer.
