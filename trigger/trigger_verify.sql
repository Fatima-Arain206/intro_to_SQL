--verify
update Sales.Products
set Product = 'Books'
where ProductID =101
--trigger will not insert in history table

select * from Sales.Products
-- trigger fire
select * from Sales.ProductsUpdateHistory