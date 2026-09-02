-- create sequence
CREATE SEQUENCE  OrderLinesSequence as int
	START WITH 1
	INCREMENT BY 1;
	alter SEQUENCE  OrderLinesSequence 
	set    OrderLinesSequence  int
	drop SEQUENCE  OrderLinesSequence 

	insert into OrderDetail(OrderLineID, OrderID, OrderDate, ProductID, Quantity, UnitPrice)
values
    (next value for OrderLinesSequence , 4,'2025-01-15',1,2,99.99),
	(next value for OrderLinesSequence ,  4,'2025-01-15',2,1,149.99)
   --(next  value for OrderLinesSequence,  5,'2025-01-20',1,3,220.99)

   select * from [Order]

   update [Order]
   set OrderID =1 
   where OrderID =4