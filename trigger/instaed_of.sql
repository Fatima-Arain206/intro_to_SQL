-- triger with instead of -- insert
CREATE  TRIGGER Sales.tg_LogOrderInsert1
on Sales.Orders
instead of insert 
as begin
insert into Sales.OrderInsertLog(OrderID)
select OrderID
from
inserted 
end;
-- check
insert into Sales.Orders
values(14,108,7,14,'2026-09-01','2026-09-04','Shipped',null,null,12,60,GETDATE())
select * from Sales.OrderInsertLog
