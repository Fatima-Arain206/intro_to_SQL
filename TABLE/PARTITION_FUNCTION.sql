-- partition range
CREATE PARTITION FUNCTION
PF_HireDate(Date)
as RANGE RIGHT FOR VALUES
(
'2024-01-01',
'2025-01-01',
'2026-01-01');
