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