---partion index
create nonclustered index IX_Order_Customer 
on [Order](OrderDate)
on PS_orderDate(OrderDate)

-- non alingned
create nonclustered index
IX_Order_Customer2
on [Order](CustomerName)
on PS_orderdate(OrderDate);


  INSERT INTO [Order] VALUES
        ('2025-01-15', 'John Smith', 299.97, 'Deliverd'),
        ('2025-02-20', 'Jane Doe', 149.99, 'Shipped'),
        ('2025-06-10', 'Bob Johnson', 449.95, 'Processing');