-- query by partion

select
$Partition.PF_orderdate(OrderDate) as PartitionNumber,
count(*)OrdersPartition,
min(OrderDate) as MinDate,
Max(OrderDate) as MaxDate
from [Order]
group by $Partition.PF_orderdate(OrderDate)