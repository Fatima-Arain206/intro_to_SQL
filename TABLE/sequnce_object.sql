-- create sequence
CREATE SEQUENCE  OrderLinesSequence as int
	START WITH 1
	INCREMENT BY 1;
	alter SEQUENCE  OrderLinesSequence 
	set    OrderLinesSequence  int
	drop SEQUENCE  OrderLinesSequence 

	insert into OrderDetail(OrderLineID, OrderID, OrderDate, ProductID, Quantity, UnitPrice)
values
    (next value for OrderLinesSequence , 1,'2025-01-15',1,2,99.99),
	(next value for OrderLinesSequence ,  1,'2025-01-15',2,1,149.99),
   (next  value for OrderLinesSequence,  2,'2025-01-20',1,3,220.99)