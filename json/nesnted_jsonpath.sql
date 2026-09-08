select
p.ProductID,
p.Name as ProductName,
p.ListPrice,
json_object(
'CategoryID': pc.ProductCategoryID,
'CategoryName': pc.CategoryName
) as category
from dbo.Products  p
inner join dbo.ProductCategories pc
on p.ProductCategoryID = pc.ProductCategoryID
order by p.ListPrice desc
for json path
/*This query uses JSON_OBJECT to build a nested structure. The Category property contains its own JSON object with CategoryID and CategoryName. This approach keeps related data grouped together in the output.
*/