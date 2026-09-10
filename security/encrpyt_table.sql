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
--You have two encryption types to choose from. Use deterministic when you need to perform equality comparisons,
-- joins, or filter with WHERE clauses—the same plaintext always produces the same ciphertext. Use randomized for stronger security when you don't need those query operations.




BEGIN TRANSACTION;

INSERT INTO dbo.Employees (EmployeeID, SSN, Salary)
VALUES
    (1, '123-45-6789', 50000.00),
    (2, '987-65-4321', 65000.00),
    (3, '555-12-3456', 72000.00);

COMMIT TRANSACTION;