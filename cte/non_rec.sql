/*Create nonrecursive CTEs
Nonrecursive CTEs define a result set based on a straightforward query that doesn't reference itself. This pattern is useful for simplifying complex joins, breaking down multi-step calculations, or improving code organization.

The following example uses a CTE to calculate sales metrics before joining with product information:
*/

with summaryCTE
as
(
select 
o.ProductID,
sum(o.Sales) as TotalSales,
sum(o.Quantity) as TotalQuantity
from Sales.Orders o
group by ProductID
)

select 
p.Product,
p.Category,
p.Price,
sc.TotalQuantity,
sc.TotalSales,
sc.ProductID
from
Sales.Products p
inner join summaryCTE sc
on p.ProductID = sc.ProductID
order by sc.TotalSales desc