--======================
-- Drop Table template
--======================
IF EXISTS (
  SELECT *
	FROM sys.tables
	JOIN sys.schemas
	  ON sys.tables.schema_id = sys.schemas.schema_id
   WHERE sys.schemas.name = N'dbo'
	 AND sys.tables.name = N'Productos'
)
  DROP TABLE dbo.Productos
GO
