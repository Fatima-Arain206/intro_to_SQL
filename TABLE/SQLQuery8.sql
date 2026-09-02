-- partion table
create partition function 
PF_orderdate(Date)
as range right
for values
('2025-01-01', '2025-04-01', '2025-07-01', '2025-10-01');


-- create scheme
create partition scheme 
PS_orderdate as  partition PF_orderDate
all to  ([Primary])


-- create partion table

create table [Order](
OrderID bigint identity(1,1),
OrderDate Date not null,
CustomerName nvarchar(100) not null,
TotalAmount decimal(12,2),
OrderStatus nvarchar(20) default 'pending',
check (TotalAmount >0),
check (OrderStatus in('Pending','Processing','Shipped','Deliverd','Cancelled')),


constraint  PK_order primary key(OrderID,OrderDate))
on PS_orderdate(OrderDate);

