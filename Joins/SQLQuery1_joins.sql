--joins
/* TABLE A 
TABLE B
what do want exactly do you want to combine them by rows or col
if you like to combiine with columns 
we said joining tables
Table A is left table and table B is right table
types
iiner join, left join , right ,full join
sql gonna takes the col and rows of table a and after that right table
*/
use MyDatabase
--set  op combine or appened the rows
/* if you wanna combine them by rows 
you have the same columns sql gonna make a stake set all rows of table and and after all rows will B

uninon , uninon al, except 
*/

/* data inrichmenet 
some times you need extra inforamtion from another table 
we use joins there 
# 3 check for existance 'filtering'
to check one thing in one table to anther table
*/


--lets start with no-join
-- it will not join 2 sts it just retrive two tables
-- SQL task retrive all data from customers and orders 

select *
from customers;
select * 
from orders
