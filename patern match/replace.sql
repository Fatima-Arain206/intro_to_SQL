-- Swap first and last name
DECLARE @name NVARCHAR(100) = 'Smith, John';
SELECT REGEXP_REPLACE(@name, '^(\w+),\s*(\w+)$', '$2 $1') AS SwappedName;
-- Returns: John Smith

-- Mask credit card numbers (show last 4 digits only)
DECLARE @card NVARCHAR(20) = '4532-1234-5678-9012';
SELECT REGEXP_REPLACE(@card, '\d(?=[\d-]{4,})', '*') AS MaskedCard;
-- Returns: ****-****-****-9012