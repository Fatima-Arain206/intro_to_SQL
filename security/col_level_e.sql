--Column-level encryption using T-SQL functions gives you an alternative when you need more control over the encryption process, or when Always Encrypted isn't the right fit. With this approach, you manage symmetric or asymmetric keys stored within the database.

--Start by creating a database master key and certificate:

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'StrongPassword123!';

CREATE CERTIFICATE SensitiveDataCert
WITH SUBJECT = 'Certificate for sensitive data encryption';



--Create a symmetric key protected by the certificate:

CREATE SYMMETRIC KEY SensitiveDataKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE SensitiveDataCert;

CREATE TABLE dbo.Employees
(
	EmployeeID int NOT NULL PRIMARY KEY,
	SSN varbinary(256) NULL
);

--To encrypt data, open the symmetric key and use the ENCRYPTBYKEY function:

OPEN SYMMETRIC KEY SensitiveDataKey
DECRYPTION BY CERTIFICATE SensitiveDataCert;

INSERT INTO dbo.Employees (EmployeeID, SSN)
VALUES (1, ENCRYPTBYKEY(KEY_GUID('SensitiveDataKey'), '123-45-6789'));

CLOSE SYMMETRIC KEY SensitiveDataKey;

USE [fatima]; -- Replace with the database you are using
GO

IF NOT EXISTS (SELECT 1 FROM sys.symmetric_keys WHERE name = '##MS_DatabaseMasterKey##')
    CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'StrongPassword123!';
GO

IF NOT EXISTS (SELECT 1 FROM sys.certificates WHERE name = 'SensitiveDataCert')
    CREATE CERTIFICATE SensitiveDataCert
    WITH SUBJECT = 'Certificate for sensitive data encryption';
GO

IF NOT EXISTS (SELECT 1 FROM sys.symmetric_keys WHERE name = 'SensitiveDataKey')
    CREATE SYMMETRIC KEY SensitiveDataKey
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE SensitiveDataCert;
GO

IF OBJECT_ID('dbo.Employees', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Employees
    (
        EmployeeID int NOT NULL PRIMARY KEY,
        SSN varbinary(256) NULL
    );
END;
GO

OPEN SYMMETRIC KEY SensitiveDataKey
DECRYPTION BY CERTIFICATE SensitiveDataCert;

IF NOT EXISTS (SELECT 1 FROM dbo.Employees WHERE EmployeeID = 1)
BEGIN
    INSERT INTO dbo.Employees (EmployeeID, SSN)
    VALUES
    (
        1,
        ENCRYPTBYKEY(KEY_GUID('SensitiveDataKey'), '123-45-6789')
    );
END;

CLOSE SYMMETRIC KEY SensitiveDataKey;
GO