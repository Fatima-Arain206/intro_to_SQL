--The following T-SQL statement creates a metadata entry pointing to your key in Azure Key Vault. The actual key material remains in the vault, never stored in the database.

--SQL
CREATE COLUMN MASTER KEY MyCMK
WITH (
    KEY_STORE_PROVIDER_NAME = 'AZURE_KEY_VAULT',
    KEY_PATH = 'https://mykeyvault.vault.azure.net/keys/MyCMK/abc123'
);