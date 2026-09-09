select * from 
dbo.DBCsutomers
where   Salary > 20000 and Department ='IT' -- here sql is not using indec


select * from 
dbo.DBCsutomers
where Department ='IT' -- here sql is using the index and following left rulle
-- the search and the index column  order are  same

--
select * from 
dbo.DBCsutomers
where  Salary < 40000 -- here index is not working