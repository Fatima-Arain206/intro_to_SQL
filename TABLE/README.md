# TABLE

## Tables are the heart of SQL

A table stores data in rows and columns. Every database table is built like a spreadsheet, but with rules and relationships.

## Basic table example

```sql
CREATE TABLE dbo.Customer (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NULL,
    CreatedDate DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
```

## Important concepts

### Columns
Each column has a data type and rules.

```sql
CustomerId INT,
FirstName NVARCHAR(50),
OrderDate DATETIME2,
TotalAmount DECIMAL(10,2)
```

### Primary Key
Uniquely identifies each row.

```sql
CustomerId INT PRIMARY KEY
```

### Foreign Key
Links one table to another.

```sql
CREATE TABLE dbo.Order (
    OrderId INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerId)
        REFERENCES dbo.Customer(CustomerId)
);
```

### Constraints
- `PRIMARY KEY`
- `FOREIGN KEY`
- `UNIQUE`
- `NOT NULL`
- `CHECK`
- `DEFAULT`

## Common DDL commands

### Create table
```sql
CREATE TABLE dbo.Product (
    ProductId INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);
```

### Alter table
```sql
ALTER TABLE dbo.Product
ADD Category NVARCHAR(50);
```

### Drop table
```sql
DROP TABLE dbo.Product;
```

### Truncate table
```sql
TRUNCATE TABLE dbo.Product;
```

## Best practices

- name tables clearly
- use schema prefix like `dbo.TableName`
- choose correct data types
- keep table design simple
- use keys to connect tables

## Practice tasks

1. Create a `Student` table
2. Add a `Course` table with a foreign key
3. Insert 3 sample rows
4. Run a `SELECT` query to view results

This folder helps you learn table design and SQL table operations.
