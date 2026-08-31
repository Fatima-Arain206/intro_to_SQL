select
first_name,
len(first_name) as length_f,
Len(LTrim(first_name)) as len_af_tr,
len(first_name) - len(trim(first_name) )as flag
from customers
WHERE len(first_name) != len(trim(first_name) )