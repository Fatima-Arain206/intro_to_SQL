--TRIM
-- LEADING AND TRAILING SPACES

--TASK
--FIND CUSTOMERS WHOSE FIRST NAME CONTAINS LEADING OR TRAILLING SPACES
SELECT id,
first_name,
len(first_name) as len,
len(TRIM(first_name))
FROM customers
where first_name != trim(first_name)
update customers
set first_name ='John		'
where customers.id = 3