CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
    SSN char(11) COLLATE Latin1_General_BIN2
        ENCRYPTED WITH (
            ENCRYPTION_TYPE = DETERMINISTIC,
            ALGORITHM = 'AEAD_AES_256_CBC_HMAC_SHA_256',
            COLUMN_ENCRYPTION_KEY = MyCEK
        ),
    Salary money
        ENCRYPTED WITH (
            ENCRYPTION_TYPE = RANDOMIZED,
            ALGORITHM = 'AEAD_AES_256_CBC_HMAC_SHA_256',
            COLUMN_ENCRYPTION_KEY = MyCEK
        )
);

BEGIN TRANSACTION
INSERT INTO dbo.Employees (EmployeeID, SSN, Salary)
VALUES (1, '123-45-6789', 50000);