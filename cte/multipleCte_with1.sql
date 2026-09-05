/*
You can define multiple CTEs in a single WITH clause by separating them with commas. Later CTEs can reference earlier ones, enabling progressive data transformation:
*/
with SummaryOfSales as (
	select 
	p.Category,
	sum(p.Price) as revenue,
	p.Product,
	sum(oa.Sales) totalSales,
	sum(oa.Quantity) as totalqunatity

from Sales.Products as p
inner join Sales.OrdersArchive oa
on p.ProductID = oa.ProductID
group by p.Product,p.Category
),
-- seccond cte
rankedCategory as(
select 
p.ProductID,
p.Category,
p.Product
from Sales.Products p
)

select * from SummaryOfSales ss
inner join rankedCategory rc
on rc.Category =ss.Category
WHERE ss.revenue >=60 ;
