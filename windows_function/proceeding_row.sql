--Define window frames with ROWS and RANGE

/*
Window frames let you specify exactly which rows relative to the current row should be included in the calculation. The ROWS clause counts physical rows, while RANGE groups rows with equal values.

Frame boundaries can be specified using:

UNBOUNDED PRECEDING: From the partition start
n PRECEDING: n rows before current row
CURRENT ROW: The current row
n FOLLOWING: n rows after current row
UNBOUNDED FOLLOWING: To the partition end
The following query calculates a moving average over the last three orders:
*/
select 
o.OrderDate,
o.ProductID,
o.Sales,

avg(o.Sales)over(order by orderDate rows between 3 PRECEDING and current row) as avg_sale

from Sales.Orders o
order by OrderDate desc