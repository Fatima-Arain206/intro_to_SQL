# SQL Security

## Security in SQL Server

This folder covers database and data protection concepts.

## Core topics

- user permissions
- row-level security
- encryption
- masking
- auditing
- grants and denies

## Example grant

```sql
GRANT SELECT ON dbo.Customer TO UserA;
```

## Example deny

```sql
DENY SELECT ON dbo.Customer TO UserB;
```

## Why this matters

Data should be protected from unauthorized access, especially in production systems.

## Best practices

- grant minimum permissions
- use roles instead of direct user access when possible
- review audits regularly
- use encryption for sensitive data

This folder contains SQL examples for learning database security concepts.
