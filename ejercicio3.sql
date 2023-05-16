-- =============================================
-- Create Database with MEMORY_OPTIMIZED_DATA Filegroup Template
-- =============================================

IF EXISTS (
  SELECT * 
    FROM sys.databases 
   WHERE name = N'DBEjemplo1'
)
  DROP DATABASE DBEjemplo1
GO

CREATE DATABASE DBEjemplo1
ON PRIMARY
  (NAME = sample_DBEjemplo1_file1,
    FILENAME = N'C:\PP_lll\BDs\Datasample_DBEjemplo1_1.mdf',
          SIZE = 70MB,
          MAXSIZE = 80MB,
          FILEGROWTH = 10%),

FILEGROUP memory_optimized_data_filegroup  CONTAINS MEMORY_OPTIMIZED_DATA
  ( NAME = sample_DBEjemplo1_filegroup_file1,
    FILENAME = N'C:\PP_lll\BDs\Datasample_DBEjemplo1_1')

LOG ON
  ( NAME = sample_DBEjemplo1_log_file1,
    FILENAME = N'C:\PP_lll\BDs\Datasample_DBEjemplo1_1.ldf',
          SIZE = 10MB,
          MAXSIZE = 50MB,
          FILEGROWTH = 10%)
GO
