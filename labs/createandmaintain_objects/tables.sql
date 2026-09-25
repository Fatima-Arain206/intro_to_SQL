 -- Create Supplier table
 CREATE DATABASE EcommeraceDB
 GO
 USE EcommeraceDB 
 GO
CREATE TABLE SUPPLIER(
    SupplierID int PRIMARY KEY IDENTITY(1,1),
    SupplierName varchar(100) not null UNIQUE,
    Country varchar(50) ,
    Email varchar(70) not null,
    Phone varchar(20) not null,
    CreateDate datetime2 DEFAULT  GETUTCDATE()


);
-- create category table
CREATE TABLE Category(
    CategoryID int PRIMARY KEY identity(1,1),
    CategoryName VARCHAR(100) not null UNIQUE,
    Descripton VARCHAR(500)
);
-- prodcut table'

CREATE TABLE Product
(
    ProductID int PRIMARY KEY identity(1,1),
    ProductName varchar(100)  NOT NULL UNIQUE,
    CategoryID int not null,
    SupplierID int not null,
    UnitPrice DECIMAL(10,2) not null,
    UnitinStock int not null DEFAULT 0,
    check (UnitPrice > 0),
    check (UnitinStock >= 0),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- index
create index idx_category on Product(CategoryID)
create index idx_Supplier on Product(SupplierID)