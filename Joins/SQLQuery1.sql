use MYDATABASE
CREATE TABLE customers(
id int IDENTITY(1,1),
first_name varchar(50),
country varchar(50),
score int )

CREATE  TABLE orders(
order_id int,
customer_id smallint identity(1,1),
order_date DATETIME,
sales smallint)

