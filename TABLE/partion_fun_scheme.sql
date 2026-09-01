--non align non cluster column store index
select * from Employees
CREATE PARTITION FUNCTION 
PF_OrderDate(Date)
as range right 
for values
('2023-01-01','2024-01-01','2025-01-01');
--scheme
create partition scheme 
PS_OrderDate
as partition PF_OrderDate
all to ([PRIMARY]);

