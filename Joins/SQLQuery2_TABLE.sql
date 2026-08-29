
CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),       -- Auto-incrementing surrogate key (4 bytes)
    ProductName NVARCHAR(100) NOT NULL,             -- Unicode support, appropriate length, enforced
    Category NVARCHAR(50) NOT NULL,                 -- Smaller than ProductName (categorization needs less space)
    Price DECIMAL(10,2) NOT NULL,                   -- Exact precision for financial data
    StockQuantity INT NOT NULL DEFAULT 0,           -- Integer sufficient for inventory, default prevents nulls
    LastRestocked DATETIME2 DEFAULT GETUTCDATE()    -- Modern date type with automatic timestamp
);

-- Estimate row size for a table
-- Fixed-length columns: sum of column sizes
-- Variable-length: estimate average size
-- Example row calculation:
CREATE TABLE Employee (
    EmployeeID INT,              -- 4 bytes
    FirstName NVARCHAR(50),      -- ~2-100 bytes (avg 40)
    LastName NVARCHAR(50),       -- ~2-100 bytes (avg 40)
    HireDate DATE,               -- 3 bytes
    Salary DECIMAL(10,2)         -- 5 bytes
);  
-- Estimated row size: 4 + 40 + 40 + 3 + 5 = ~92 bytes
-- Plus row overhead (~7 bytes) = ~99 bytes per row
-- 1 million rows ≈ 94 MB