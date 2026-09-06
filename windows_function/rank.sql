--rank
/*
This query ranks all products by price from highest to lowest. Each product receives a unique number regardless of whether multiple products share the same price.

RANK() assigns the same rank to tied values, then skips numbers to account for the ties:
*/
select 
o.ProductID,
o.Sales,
o.OrderStatus,
rank() over(order by ProductID) as rank_row

from Sales.Orders o
/*en two products have identical prices, both receive the same rank. The next product's rank reflects the total number of products ranked higher, creating gaps in the sequence.
