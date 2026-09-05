--- lets make a trigger on products with after update
--select* from Sales.Products

	CREATE TRIGGER Sales.tr_updatePrice
	on Sales.Products
	after update
	as 
	begin
		if UPDATE(Price)
			begin
				insert into Sales.ProductsUpdateHistory(ProductID,OldPrice,NewPrice,ChangeDate)

				select 
				d.ProductID,
				d.Price,
				i.Price,
				GETDATE()
				from deleted d
				inner join inserted i --both temp tables new old 
				on d.ProductID = i.ProductID
				where d.Price <> i.Price --<>not eqaul
				end
			end;
