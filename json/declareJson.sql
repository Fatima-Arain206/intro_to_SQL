DECLARE @json NVARCHAR(MAX) = N'[
    {"id": 1, "name": "Widget", "price": 29.99},
    {"id": 2, "name": "Gadget", "price": 49.99},
    {"id": 3, "name": "Gizmo", "price": 19.99}
]';

SELECT * FROM OPENJSON(@json);
--Without a schema, OPENJSON returns three columns: key (the array index or property name), value (the JSON content), and type (a number indicating the JSON data type: 0=null, 1=string, 2=number, 3=boolean, 4=array, 5=object).
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
--The WITH clause maps JSON properties to typed columns. This approach gives you proper data types for calculations and comparisons, 
--and lets you select only the properties you need.