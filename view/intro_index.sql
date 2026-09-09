-- what is an index
-- data sturcture provides qiuck access to data, optimizing the speed of uour quries
-- speciallly when you have big tables
-- index 
--sturcture -> clustered  -- non--clusted
--...> storage...> rwostorw and column store
--functions  unique index and filtered index
--page is the smallest unit of data storage 8kb
--data page:
-- it has a header with unique number and stores row and at the end a off set array
--index--page: it contais pointer of another page or the data page it has the key
--off set array :it is a quick index having numbers of rows if  one row beggin from 96 it has these address
-- it reduces the scanning
--
-- heap table: a heap table is store table without clustred index the data is random in storage not sorted
-- the insertion is very fast in heap table but searching is very slow
-- it scan all data pages this processs is called full table scan 
-- it scan entire table page by page row by row


---
--"clustred index""
--- if you create a clustered index on that table sql arrange the all pages in sorting row by row

-- B tree sturctue it hold root node
-- root node hold the pointer of intermediate nodes
-- intermdeiate node hold the index pointer of data pages / leaf level 