-- add mata data
select * from Products
update Products
set MetaData=
'{
"color":"red",
"size":"small",
"material":"slik"
}'
where ProductID =2

