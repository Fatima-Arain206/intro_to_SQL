/*
NTILE(n) distributes rows into a specified number of roughly equal groups:

*/
select 
p.Category,
p.Price,
p.Product,
NTILE(4) over( order by p.price) as perQuartile

from Sales.Products p