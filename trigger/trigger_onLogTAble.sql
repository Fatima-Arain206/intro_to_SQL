-- trigger on SAles table
create trigger tg_LogOrderInsert
on Sales.Orders
after insert
as
begin
	insert into
	Sales.OrderInsertLog(OrderID)
	select OrderID
	from inserted;
end;  