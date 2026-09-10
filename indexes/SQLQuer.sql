--create
select * from sys.tables
select * from Orders
--create or alter clustered index 
alter   index PK_Orders 
(OrderDate)
on dbo.Orders
  -- cls_index_on_date on Orders(OrderDate)