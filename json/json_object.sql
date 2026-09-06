select JSON_OBJECT(
'ProductID':ProductID,
'Name': Product,
'Category':Category,
'price':Price
) as Json_objest
,JSON_QUERY(Json_objest,'$.1') 
from Sales.Products
