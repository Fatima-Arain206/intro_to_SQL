with generateNUmber
as
(
select 1 as anchor
union all
select anchor+1 
from generateNUmber
where anchor <10
)
select * from generateNUmber 