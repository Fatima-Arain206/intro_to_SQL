/*
You can pass column values, variables, or literal values to JSON_ARRAY(). The function creates a properly formatted JSON array regardless of the input types.

Then, combine these functions to build nested JSON structures. The following example constructs a complete order JSON object with customer and totals information:

SQL*/
SELECT JSON_OBJECT(
    'orderId': soh.OrderID,
    'orderDate': soh.OrderDate,
    'customer': JSON_OBJECT(
        'id': c.CustomerID,
        'name': c.FirstName
    ),
    'totals': JSON_OBJECT(
        'subtotal': soh.Quantity,
        'tax': soh.Sales,
        'total': sum(Sales)
    )
) AS OrderJson
FROM Sales.Orders AS soh
INNER JOIN Sales.Customers AS c
    ON soh.CustomerID = c.CustomerID
WHERE soh.OrderID = 4;
