DECLARE @json NVARCHAR(MAX) = N'{
    "customer": {
        "id": 12345,
        "name": "Contoso Ltd"
    },
    "items": [
        {"product": "Widget", "qty": 5},
        {"product": "Gadget", "qty": 3}
    ]
}';

SELECT 
    JSON_QUERY(@json, '$.customer') AS CustomerObject,
    JSON_QUERY(@json, '$.items') AS ItemsArray;