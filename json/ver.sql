SELECT 
    ProductID,
    ProductName,
    Price
FROM OPENJSON(@json)
WITH (
    ProductID INT '$.id',
    ProductName NVARCHAR(100) '$.name',
    Price DECIMAL(10,2) '$.price'
);