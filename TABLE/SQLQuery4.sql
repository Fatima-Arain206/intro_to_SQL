--add matedata
alter table Products
add MetaData json 

-- computed column
alter table Products
add MetaDataColor as JSON_VALUE(MetaData,'$.color');
