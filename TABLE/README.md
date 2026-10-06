# TABLE

This folder focuses on table design, table-level constraints, partitioning, indexing, and table operations in SQL Server.

## What this section covers
- creating tables
- altering table structure
- primary and foreign keys
- computed columns
- default values
- identity/sequence objects
- JSON columns and table JSON operations
- partitioning and aligned indexes
- indexing strategies for performance

## Why this is important
A table is the foundation of every database. If the table design is poor, queries become slow and logic becomes fragile.

## Key SQL Server topics here
- `CREATE TABLE` with explicit column definitions
- `CONSTRAINT` usage for data integrity
- `IDENTITY`, `SEQUENCE`, and default values
- indexing patterns: clustered, nonclustered, aligned, non-aligned
- partitioning for large data sets
- JSON columns and functions like `JSON_VALUE`, `OPENJSON`, and `JSON_MODIFY`

## Example
```sql
CREATE TABLE dbo.Customer (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
```

## Good habits
- Use PascalCase for column names
- Prefer explicit schema names: `dbo.Customer`
- Use constraints instead of manual validation in application code
- Add indexes only after checking query patterns
- Use `EXISTS` for checks instead of `COUNT(*)`

## Practice tasks
1. Create a table with PK and FK constraints.
2. Add a unique constraint and a default value.
3. Compare clustered vs nonclustered index behavior.
4. Analyze a table using `sys.indexes` and `sys.objects`.

This folder is the core of database design and should be practiced carefully.
