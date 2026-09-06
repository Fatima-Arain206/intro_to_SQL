CREATE TABLE dbo.Person (
    PersonID INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(200),
    Department NVARCHAR(50)
) AS NODE;


CREATE TABLE dbo.Product (
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(200) NOT NULL,
    Category NVARCHAR(100),
    Price DECIMAL(10, 2)
) AS NODE;


CREATE TABLE dbo.Location (
    LocationID INT PRIMARY KEY,
    City NVARCHAR(100) NOT NULL,
    CountryRegion NVARCHAR(100) NOT NULL
) AS NODE;