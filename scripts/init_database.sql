/*
========================================
Create Database and Schemas
========================================

  Script:
    This script creates a new database named DataWarehouse after checking if it already exists.
    If the database exists, it is dropped and recreated. The script also sets up three Schemas - Bronze, Silver and Gold.

  Caution:
    Running this script will drop the entire DataWarehouse database if it exists.
*/

USE MASTER;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
	BEGIN 
		ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE DataWarehouse
	END;

GO
-- Create DataWarehouse Database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
