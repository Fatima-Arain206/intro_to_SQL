--Use analytical functions

/*
Analytical functions let you access data from other rows without using self-joins or subqueries. These functions are useful for time-series analysis, trend detection, and comparing current values against historical or future values. Unlike aggregate window functions that compute summaries, analytical functions retrieve specific values from specific rows in the window.

LAG() and LEAD() access values from previous or subsequent rows, like this:
*/
select
o.OrderID,
o.Sales,
lag(o.Sales,1,0) over(order by o.OrderDate) as last_sale,
lead(o.Sales,1,0)over(order by o.OrderDate) as next_sale,
o.Sales - lag(o.Sales,1,0) over(order by OrderDate) as diff_bt_curr_last

from Sales.Orders o
order by OrderDate