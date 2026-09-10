select * from 
dbo.DBCsutomers
where Department ='IT' and Salary > 20000
--  now make a composite index with same order
create index
inx_cmp_dep_sal_DBCustomer on dbo.DBCsutomers (Department,Salary)