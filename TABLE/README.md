# TABLE — Designing Reliable SQL Server Tables

## Table of Contents
- [Purpose and SQL Server fit](#purpose-and-sql-server-fit)
- [Prerequisites and learning objectives](#prerequisites-and-learning-objectives)
- [Mental model](#mental-model)
- [Demo schema (self-contained)](#demo-schema-self-contained)
- [Progressive examples](#progressive-examples)
- [Business use case](#business-use-case)
- [NULL, edge cases, and concurrency](#null-edge-cases-and-concurrency)
- [Performance, indexing, security, maintainability](#performance-indexing-security-maintainability)
- [Common errors + debugging path](#common-errors--debugging-path)
- [Exercises](#exercises)
- [Navigation](#navigation)

## Purpose and SQL Server fit
Tables are the storage foundation of SQL Server. Good table design controls:
- data quality,
- performance,
- downstream query complexity.

## Prerequisites and learning objectives
**Prerequisites:** data types, PK/FK basics.  
**Objectives:** create normalized tables, enforce constraints, and reason about data integrity under concurrent writes.

## Mental model
Think of a table as:
- **Array of records** logically,
- backed by **pages + indexes** physically.

```mermaid
flowchart LR
  A[App Insert] --> B[Constraint Checks]
  B --> C[Data Page Write]
  C --> D[Index Updates]
```

## Demo schema (self-contained)
```sql
CREATE TABLE dbo.Customer
(
    CustomerID INT IDENTITY(1,1) NOT NULL,
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NULL,
    CreatedAt DATETIME2(0) NOT NULL CONSTRAINT DF_Customer_CreatedAt DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_Customer PRIMARY KEY (CustomerID),
    CONSTRAINT UQ_Customer_Email UNIQUE (Email)
);

CREATE TABLE dbo.[Order]
(
    OrderID INT IDENTITY(1,1) NOT NULL,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(12,2) NOT NULL,
    CONSTRAINT PK_Order PRIMARY KEY (OrderID),
    CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID) REFERENCES dbo.Customer(CustomerID),
    CONSTRAINT CK_Order_TotalAmount CHECK (TotalAmount >= 0)
);
```

## Progressive examples
### Example 1 — Insert with valid constraints
```sql
INSERT INTO dbo.Customer
(
    FirstName,
    LastName,
    Email
)
VALUES
(
    N'Ali',
    N'Khan',
    N'ali@example.com'
);
```
Line-by-line:
- `INSERT INTO dbo.Customer` targets schema-qualified table.
- Explicit column list protects against future schema changes.
- `N''` keeps Unicode safety for names.

Expected result: 1 row inserted.

### Example 2 — FK-safe order insert
```sql
INSERT INTO dbo.[Order]
(
    CustomerID,
    OrderDate,
    TotalAmount
)
VALUES
(
    1,
    '2026-10-09',
    1200.00
);
```
If `CustomerID = 1` does not exist, insert fails with FK error.

### Example 3 — Stored procedure with TRY...CATCH
```sql
CREATE OR ALTER PROCEDURE dbo.usp_CreateOrder
    @CustomerID INT,
    @OrderDate DATE,
    @TotalAmount DECIMAL(12,2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO dbo.[Order]
        (
            CustomerID,
            OrderDate,
            TotalAmount
        )
        VALUES
        (
            @CustomerID,
            @OrderDate,
            @TotalAmount
        );
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
```
Why this pattern:
- Procedure params are parameterized by design.
- `SET NOCOUNT ON` avoids noisy rowcount chatter.
- `TRY...CATCH` centralizes error path.

## Business use case
E-commerce order capture: table constraints prevent negative totals and orphan orders even when multiple app services write concurrently.

## NULL, edge cases, and concurrency
- `Email` is nullable: multiple NULL values are allowed in SQL Server unique constraints.
- High insert concurrency can cause last-page latch pressure; sequential keys may need tuning strategies later.
- Always define clear NULL intent per column (unknown vs not-applicable).

## Performance, indexing, security, maintainability
- Add nonclustered index for common filters:
```sql
CREATE INDEX IX_Order_CustomerID_OrderDate
    ON dbo.[Order](CustomerID, OrderDate);
```
- Avoid over-indexing write-heavy tables.
- Grant least privilege only to procedures where possible.

## Common errors + debugging path
1. **PK violation**: duplicate key.
2. **FK violation**: parent row missing.
3. **CHECK violation**: invalid domain value.

Debug questions:
- Which constraint name appears in error?
- Is source data invalid or mapping wrong?
- Did a transaction roll back earlier prerequisite writes?

## Exercises
1. Beginner: add `PhoneNumber` with NULL allowed and update one row.
2. Intermediate: enforce `OrderDate <= CAST(SYSUTCDATETIME() AS DATE)` with CHECK.
3. Advanced: model `OrderItem` table and reason about composite PK.

DSA connection: constraints act like **invariants in a data structure** (e.g., BST ordering rules).

## Navigation
Previous: [Repository Home](../README.md)  
Next: [Joins](../Joins/README.md)  
Related: [Indexes](../indexes/README.md), [Procedure](../procedure/README.md)
