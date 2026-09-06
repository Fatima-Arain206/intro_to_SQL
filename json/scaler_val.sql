DECLARE @json NVARCHAR(MAX) = N'{
    "customer": {
        "id": 12345,
        "name": "Contoso Ltd",
        "active": true
    },
    "orderTotal": 1599.99
}';

SELECT 
    JSON_VALUE(@json, '$.customer.id') AS CustomerID,
    JSON_VALUE(@json, '$.customer.name') AS CustomerName,
    JSON_VALUE(@json, '$.orderTotal') AS OrderTotal;