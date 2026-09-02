CREATE TABLE OrderDetail(
OrderLineID int primary key ,
OrderID Bigint not null,
OrderDate Date not null,
ProductID int not null,
Quantity int not null,
UnitPrice Decimal not null,
LineTotal as (Quantity * UnitPrice ),
check (Quantity > 0),
check (UnitPrice > 0),
foreign key (OrderID,OrderDate) REFERENCES [Order](OrderID,OrderDate),
foreign key(ProductID) references Products(ProductID)
);

-- insert data
insert into OrderDetail(OrderLineID, OrderID, OrderDate, ProductID, Quantity, UnitPrice)
values
    (next value for OrderLinesSequence , 1,'2025-01-15',1,2,99.99),
	(next value for OrderLinesSequence ,  1,'2025-01-15',2,1,149.99),
   (next  value for OrderLinesSequence,  2,'2025-01-20',1,3,220.99)

   INSERT INTO OrderDetail (OrderLineID, OrderID, OrderDate, ProductID, Quantity, UnitPrice)
    VALUES 
        (NEXT VALUE FOR OrderLinesSequence, 4, '2025-01-15', 1, 2, 99.99),
        (NEXT VALUE FOR OrderLinesSequence, 5, '2025-01-15', 2, 1, 149.99),
        (NEXT VALUE FOR OrderLinesSequence, 6, '2025-02-20', 1, 3, 99.99);


        select * from [Order]