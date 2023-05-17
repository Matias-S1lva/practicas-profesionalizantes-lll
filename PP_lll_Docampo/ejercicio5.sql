-- =========================================
-- Create table template
-- =========================================
USE DBEjemplo1
GO

IF OBJECT_ID('dbo', 'U') IS NOT NULL
  DROP TABLE dbo.Personas
GO

CREATE TABLE dbo.Personas
(
	id int NOT NULL identity(1,1) PRIMARY KEY, 
	nombre varchar(60) NULL, 
	telefono int NULL, 
)
GO
