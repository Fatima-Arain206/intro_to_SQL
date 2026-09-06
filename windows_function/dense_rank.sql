/*DENSE_RANK() assigns the same rank to tied values but doesn't skip numbers:

*/
select o.ProductID,
o.OrderStatus,
o.OrderDate,
o.Sales,
DENSE_RANK() over(Order by ProductID desc) as dense_row

from Sales.Orders o

/*
Like RANK(), tied values share the same rank.
However, DENSE_RANK() continues with the next consecutive number, 
so you can use it to count distinct price levels.
*/