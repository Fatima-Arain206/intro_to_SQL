-- create sequence
CREATE SEQUENCE  OrderLinesSequence as int
	START WITH 1
	INCREMENT BY 1;
	alter SEQUENCE  OrderLinesSequence 
	set    OrderLinesSequence  int
	drop SEQUENCE  OrderLinesSequence 