use MYDATABASE
select *
from orders
create NONCLUSTERED INDEX 
IX_Orders_Customers
on orders(customer_id)
on PS_HireDate(order_date)