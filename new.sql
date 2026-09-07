-- Table 1: Product Categories
CREATE TABLE ProductCategories
(
    ProductCategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL
);

-- Table 2: Products
CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    ListPrice DECIMAL(10,2) NOT NULL,
    ProductCategoryID INT NOT NULL,

    CONSTRAINT FK_Products_ProductCategories
        FOREIGN KEY (ProductCategoryID)
        REFERENCES ProductCategories(ProductCategoryID)
);