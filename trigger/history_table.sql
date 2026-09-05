-- table
create table Sales.ProductsUpdateHistory
(
ProductID int not null,
OldPrice int not null,
NewPrice int not null,
ChangeDate date
)
