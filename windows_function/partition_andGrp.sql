--Combining PARTITION BY with ranking functions enables per-group rankings:
select
p.Product,
p.ProductID,
p.Price,
p.Category,
ROW_NUMBER() over(partition by p.Category order by price desc) as grp

from Sales.Products p
inner join Sales.OrdersArchive oa
on p.ProductID = oa.ProductID
where p.Price > 20

/*Use ROW_NUMBER() when you need exactly one row per rank (such as finding the top N per group). Use RANK() or DENSE_RANK() when you need to preserve tie information for reporting purposes.
*/
