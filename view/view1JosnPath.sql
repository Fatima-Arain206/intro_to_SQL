create view view_json_path
as
select 
ProductID,p.Name,ListPrice,ProductCategoryID 
from dbo.Products p
for json path
/*This query selects products with a color value and formats the results as a JSON array. Each row becomes a JSON object with properties matching the column names. The FOR JSON PATH clause handles the conversion automatically.
*/

