-- Enable auditing to blob storage (configured in Azure portal)
ALTER DATABASE AUDIT SPECIFICATION AzureAuditSpec
ADD (SELECT, INSERT, UPDATE, DELETE ON DATABASE::mcpdatabaseserverlab BY public)
WITH (STATE = ON);