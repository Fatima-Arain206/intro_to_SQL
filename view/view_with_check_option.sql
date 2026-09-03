-- create a view with check option
-- without chek option
create view without_check_op
as 
select
o.OrderID,
o.Quantity,
o.Sales
from
Sales.Orders as o
where o.Sales > 20

-- 
select * from dbo.without_check_op

-- update through view
update dbo.without_check_op
set Sales = 10 
where OrderID =11

-- with check option

create view Sales.chech_op
as 
select
p.ProductID,
p.Price,
p.Product
from Sales.Products as p
where p.Price>=20
with check option;


--verify
select * from Sales.chech_op
-- now update through view
update Sales.chech_op
set Price = 10
where ProductID=106