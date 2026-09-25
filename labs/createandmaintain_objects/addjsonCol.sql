alter  table Product 
add MetaData json 
GO
--
 -- Add computed column for indexing
alter TABLE Product 
ADD
MetaDataColor as JSON_VALUE(MetaData,'$.color')

--  -- Create index on the computed column
CREATE NONCLUSTERED index idx_metadatacolor_Product
on Product(MetaDataColor)


-- insert
update Product
set MetaData ='{
"color":"blue",
"size":34,
"Materail":"cotton"

}'
where ProductID=1

SELECT* from Product
-- update

update Product
set MetaData = JSON_MODIFY(MetaData,'$.size','medium')
where ProductID = 2

-- view

SELECT

p.ProductID,
p.ProductName,
JSON_VALUE(MetaData,'$.color'),
JSON_VALUE(MetaData,'$.size'),
JSON_VALUE(MetaData,'$.Materail')
from Product as p
where  MetaDataColor='blue'


UPDATE Product
set ProductName ='Frock'
where ProductID=1