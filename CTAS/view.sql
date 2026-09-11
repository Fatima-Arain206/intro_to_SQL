--ctas create table as select
-- classical way create/insert
-- create table as select 


create or alter view vw_minilab_employe
as


-- view
select * from dbo.Employees e
where e.Salary >60000

select * from dbo.vw_minilab_employe




-- CTAS
