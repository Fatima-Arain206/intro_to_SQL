-- create a table supplier
CREATE TABLE Supplier(
SupplierID INT PRIMARY KEY IDENTITY(1,1),
SupplierName VARCHAR(100) UNIQUE,
Country NVARCHAR(50) NOT NULL,
Email NVARCHAR(100) ,
Phone NVARCHAR(20),
CreateDate DATETIME2 DEFAULT GETUTCDATE()
);
-- category table2
CREATE TABLE Category(
CategoryID INT PRIMARY KEY IDENTITY(1,1),
CategoryName NVARCHAR(100) UNIQUE,
Description nvarchar(500) );

--- product table
CREATE TABLE Products(
ProductID int primary key identity(1,1),
ProductName NVARCHAR(100) NOT NULL,
CategoryID int not null,
SupplierID int not null,
BasePrice decimal(10,2) not null,
StockQuantity int default 0 NOT NULL,
CreatedDate datetime2 default GETUTCDATE(),
CHECK (BasePrice> 0),
check (StockQuantity >= 0) ,
foreign key  (CategoryID) references Category(CategoryID),
foreign key (SupplierID) references Supplier(SupplierID)
);




