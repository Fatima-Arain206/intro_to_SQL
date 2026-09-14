CREATE VECTOR INDEX idx_Products_DescriptionVector
ON dbo.Products(DescriptionVector)
WITH (METRIC = 'cosine', TYPE = 'DiskANN');