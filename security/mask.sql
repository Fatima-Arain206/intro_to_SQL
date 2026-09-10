CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,

    FirstName varchar(50),

    LastName varchar(50),

    Email varchar(100)
        MASKED WITH (FUNCTION = 'email()'),

    Phone varchar(20)
        MASKED WITH (FUNCTION = 'partial(3, "-XXX-XX", 2)'),

    CreditCardNumber varchar(19)
        MASKED WITH (FUNCTION = 'partial(0, "XXXX-XXXX-XXXX-", 4)'),

    Income decimal(18,2)
        MASKED WITH (FUNCTION = 'random(10000, 100000)'),

    SSN char(11)
        MASKED WITH (FUNCTION = 'default()')
);

ALTER TABLE Customers
ALTER COLUMN DateOfBirth ADD MASKED WITH (FUNCTION = 'default()');


ALTER TABLE Customers
ALTER COLUMN DateOfBirth
DROP MASKED;



--Control mask visibility with permissions
--By default, users see masked data unless they have elevated permissions. The UNMASK permission controls who sees the real values behind the masks.

--To allow a user to see all unmasked data in the database:

--SQL
GRANT UNMASK TO DataAnalyst;