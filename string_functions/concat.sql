--string function
--manuplation
--concat
--it combines multiple string values in one string

-- task combine customer name with country name
select 
first_name,
country,
concat(first_name,'-',country) as first_nameAndCountry,
LOWER(first_name) as lower_case,
upper(first_name) as upper_case
from customers