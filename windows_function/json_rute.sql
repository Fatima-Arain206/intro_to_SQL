-- josn path
with RankedProduts as(
select 
    p.ProductID,
    p.Name,
    pc.CategoryName,
    p.ListPrice,
    row_number() over(partition by pc.ProductCategoryID order by p.ListPrice desc) as priceRank

from dbo.Products p
inner join dbo.ProductCategories as pc
on p.ProductCategoryID = pc.ProductCategoryID
where p.ListPrice >0
)

select 
ProductID,
     Name,
     CategoryName,
     ListPrice,
     priceRank
from RankedProduts
WHERE PriceRank <= 3
 ORDER BY CategoryName, PriceRank
 for json path ,root('topProduct')
 /*
 Adding ROOT('TopProducts') wraps the entire JSON array in an object with a named property. This makes the output easier to work with in applications that expect a root element.*\