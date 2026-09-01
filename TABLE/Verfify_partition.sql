select
$PARTITION.PF_OrderDate(HireDate) as PartionNumber,
count(*) as RowCount_,
min(HireDate) as MiniHireDate,
max(HireDate) as maxiHireDate
from dbo.Employees
group by $PARTITION.PF_OrderDate(HireDate)
order by PartionNumber;

