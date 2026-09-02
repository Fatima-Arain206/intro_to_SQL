-- query
select 
ProductID,ProductName,
JSON_VALUE(MetaData,'$.color')as color,
JSON_VALUE(MetaData,'$.size') as Size,
JSON_VALUE(MetaData,'$.material') as material

from Products
where MetaDataColor ='blue'