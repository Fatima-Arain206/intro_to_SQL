-- cross join 
-- comnine every row from the left every row from the right 
-- all the possible combinations 
-- if a table has 3 rows and b table has 4 then the cross join will be 3x4=12

select * from customers
select * from orders -- 5 x4 = 20

select *
from customers
cross join orders