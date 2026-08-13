	use MyDatabase
	select * from customers
	--like operator is use for search a patern in your database in txt form
	-- M% it refers anything start from a M and end at anything

	-- %in  ..it start from anything and end on in

	--%r%  it start from anything and end at any thing r can be at starting , between end ,it can be any where
	/* # under score _
	__b% 
	it means there should be any thing on first and second position but must be on third
	position there shold be b and after that anything
	*/
	select * 
	from customers
	where first_name like 'M%'-- it dosenot matter what comes after M

	select* 
	from customers
	where first_name 
	like '%n'

	-- underscore
	select * from customers
	where first_name like '__r%'
	

	select * from customers
	where first_name like '__t%'
