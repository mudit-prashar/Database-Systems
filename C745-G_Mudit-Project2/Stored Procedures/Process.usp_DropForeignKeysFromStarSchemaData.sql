USE [BIClass]
GO

if OBJECT_ID('[Process].[usp_DropForeignKeysFromStarSchemaData]') is not null 
DROP PROCEDURE [Process].[usp_DropForeignKeysFromStarSchemaData]
GO 
/****** Object:  StoredProcedure [Project2].[DropForeignKeysFromStarSchemaData]    Script Date: 11/16/2019 5:45:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar 
-- Procedure:	Process.usp_DropForeignKeysFromStarSchemaData
-- Create date: 11/16/19
-- Description:	Drop the Foreign Keys From the Star Schema
-- =============================================
CREATE PROCEDURE [Process].[usp_DropForeignKeysFromStarSchemaData]
AS
BEGIN
    SET NOCOUNT ON;
	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimCustomer]

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimGender] 
	
	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimMaritalStatus]

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimOccupation] 

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimOrderDate] 

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimProduct]

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_DimTerritory]

	ALTER TABLE [CH01-01-Fact].[Data]  drop  CONSTRAINT [FK_Data_SalesManagers]

END;
