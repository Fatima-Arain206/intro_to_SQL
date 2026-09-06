/*Ranking functions assign sequential numbers to rows based on their position within a partition. SQL Server provides four ranking functions. Each function handles ties differently:

ROW_NUMBER() assigns a unique sequential number to each row, with no duplicates even for tied values:

SQL*/
use SalesDB
select 
p.ProductID,
--p.Product,
p.Sales,
ROW_NUMBER() over (order by P.ProductID desc) as row_

from Sales.Orders p