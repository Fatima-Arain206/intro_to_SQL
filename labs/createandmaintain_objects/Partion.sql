--Create a partitioned order table

CREATE PARTITION function pf_orderDate_partion(Date)
    as range right for VALUES
    ('2025-01-01', '2025-04-01', '2025-07-01', '2025-10-01')

-- scheme
create PARTITION SCHEME ps_orderscheme
    as PARTITION pf_orderdate_partion ALL TO ([PRIMARY])

CREATE TABLE [Order](
    OrderID Bigint IDENTITY(1,1),
    OrderDate Date not null,
    CustomerName NVARCHAR(100) not null,
    TotalAmount decimal(10,2)not null,
    OrderStatus NVARCHAR(20) DEFAULT 'Pending'
    CONSTRAINT pk_Order PRIMARY KEY (OrderID,OrderDate),
    CHECK(TotalAmount >0),
    CHECK(OrderStatus in('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'))
) ON ps_orderscheme(OrderDate)

  -- Create partitioned index
  create NONCLUSTERED index idx_order_date_customer
  on [order](CustomerName)
  on ps_orderscheme(OrderDate)
-- insert data
insert into [Order]
     VALUES('2025-01-15', 'John Smith', 299.97, 'Delivered'),
     ('2025-02-20', 'Jane Doe', 149.99, 'Shipped'),
     ('2025-06-10', 'Bob Johnson', 449.95, 'Processing');
 GO