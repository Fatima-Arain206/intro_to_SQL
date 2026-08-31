CREATE PARTITION SCHEME
PS_HireDate
as PARTITION PF_HireDate
ALL TO([PRIMARY]);


CREATE TABLE Orders
(
OrderID int not null,
OrderDate DATE NOT NULL,
CustomerID int ,
Amount DECIMAL(10,2),
CONSTRAINT PK_Orders PRIMARY KEY(OrderID,OrderDate) ) on PS_HireDate(OrderDate);

select * from Employees;