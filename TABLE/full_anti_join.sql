-- full anti join
-- return all those rows that don't match in either tabled
SELECT *
FROM customers AS C
SELECT *
FROM orders AS C

SELECT *
FROM customers AS C
FULL JOIN orders AS O
ON C.id= O.customer_id


WHERE O.customer_id IS NULL

-- FIND CUSTOMERS WITHOUT ORDERS AND ORDERS WITHOUT CUSTOMERS
SELECT * FROM customers AS C
FULL JOIN orders AS O
ON C.id = O.customer_id
WHERE C.id IS NULL or O.customer_id is null