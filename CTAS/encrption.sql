
SELECT EmployeeID,
       CONVERT(varchar(50), DECRYPTBYKEY(EmployeEmail)) AS SSN_Decrypted
FROM dbo.Employees e;
GO
