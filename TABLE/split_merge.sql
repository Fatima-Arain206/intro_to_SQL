alter partition function
PF_OrderDate()
split range('2024-07-01');

-- merge
alter partition function
PF_OrderDate()
merge range('2024-07-01')