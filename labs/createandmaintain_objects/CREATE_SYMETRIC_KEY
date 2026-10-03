CREATE MASTER KEY ENCRYPTION BY PASSWORD = '!@#$1234asdf';
GO

CREATE CERTIFICATE sensitivedatacerti
WITH SUBJECT = 'Certificate for sensitive data encryption';
GO

-- Create a symmetric key protected by the certificate:
CREATE SYMMETRIC KEY sensitivedataKeySymmetric
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE sensitivedatacerti;
GO

-- Keep this value separate from SSN, which may use Always Encrypted.
IF COL_LENGTH('dbo.Employees', 'Customer') IS NULL
    ALTER TABLE dbo.Employees ADD Customer varbinary(256) NULL;
GO

-- To encrypt data, open the symmetric key and use the ENCRYPTBYKEY function:
OPEN SYMMETRIC KEY sensitivedataKeySymmetric
DECRYPTION BY CERTIFICATE sensitivedatacerti;

IF EXISTS (SELECT 1 FROM dbo.Employees WHERE EmployeeID = 1)
BEGIN
    UPDATE dbo.Employees
    SET Customer = ENCRYPTBYKEY(
        KEY_GUID('sensitivedataKeySymmetric'),
        '41-1111-11-111'
    )
    WHERE EmployeeID = 1;
END
ELSE
BEGIN
    INSERT INTO dbo.Employees (EmployeeID, Customer)
    VALUES
    (
        1,
        ENCRYPTBYKEY(KEY_GUID('sensitivedataKeySymmetric'), '41-1111-11-111')
    );
END;

CLOSE SYMMETRIC KEY sensitivedataKeySymmetric;
GO

-- Decrypt data
OPEN SYMMETRIC KEY sensitivedataKeySymmetric
DECRYPTION BY CERTIFICATE sensitivedatacerti;

SELECT
    EmployeeID,
    CONVERT(varchar(50), DECRYPTBYKEY(Customer)) AS Customer_Decrypted
FROM dbo.Employees
WHERE EmployeeID = 1;

CLOSE SYMMETRIC KEY sensitivedataKeySymmetric;
GO
