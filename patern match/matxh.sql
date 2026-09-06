-- Find all numbers in a string
DECLARE @text NVARCHAR(200) = 'Order 12345 contains 3 items totaling $99.99';
SELECT match_value, match_id
FROM REGEXP_MATCHES(@text, '\d+\d*');
-- Returns: 12345, 3, 99.99