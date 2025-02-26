USE [BIClass]
GO
if OBJECT_ID('[Process].[usp_AddForeignKeysToStarSchemaData]') is not null 
DROP PROCEDURE [Process].[usp_AddForeignKeysToStarSchemaData]
GO 
/****** Object:  StoredProcedure [Project2].[AddForeignKeysToStarSchemaData]    Script Date: 11/16/2019 5:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar
-- Procedure:	Process.usp_AddForeignKeysToStarSchemaData
-- Create date: 11/16/19
-- Description:	Add foreign keys to the Tables
-- =============================================
CREATE PROCEDURE [Process].[usp_AddForeignKeysToStarSchemaData]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
	SET NOCOUNT ON;
	 -- Insert statements for procedure here
	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimCustomer] FOREIGN KEY([CustomerKey])
	REFERENCES [CH01-01-Dimension].[DimCustomer] ([CustomerKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimCustomer]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimGender] FOREIGN KEY([Gender])
	REFERENCES [CH01-01-Dimension].[DimGender] ([Gender])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimGender]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimMaritalStatus] FOREIGN KEY([MaritalStatus])
	REFERENCES [CH01-01-Dimension].[DimMaritalStatus] ([MaritalStatus])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimMaritalStatus]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimOccupation] FOREIGN KEY([OccupationKey])
	REFERENCES [CH01-01-Dimension].[DimOccupation] ([OccupationKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimOccupation]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimOrderDate] FOREIGN KEY([OrderDate])
	REFERENCES [CH01-01-Dimension].[DimOrderDate] ([OrderDate])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimOrderDate]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimProduct] FOREIGN KEY([ProductKey])
	REFERENCES [CH01-01-Dimension].[DimProduct] ([ProductKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimProduct]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_DimTerritory] FOREIGN KEY([TerritoryKey])
	REFERENCES [CH01-01-Dimension].[DimTerritory] ([TerritoryKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_DimTerritory]
	--

	ALTER TABLE [CH01-01-Fact].[Data]  WITH CHECK ADD  CONSTRAINT [FK_Data_SalesManagers] FOREIGN KEY([SalesManagerKey])
	REFERENCES [CH01-01-Dimension].[SalesManagers] ([SalesManagerKey])
	--

	ALTER TABLE [CH01-01-Fact].[Data] CHECK CONSTRAINT [FK_Data_SalesManagers]
	--

	ALTER TABLE [CH01-01-Dimension].[DimProductSubcategory]  WITH CHECK ADD  CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY([ProductCategoryKey])
	REFERENCES [CH01-01-Dimension].[DimProductCategory] ([ProductCategoryKey])
	--

	ALTER TABLE [CH01-01-Dimension].[DimProductSubcategory] CHECK CONSTRAINT [FK_DimProductSubcategory_DimProductCategory]
	--


	ALTER TABLE [CH01-01-Dimension].[DimProduct]  WITH CHECK ADD  CONSTRAINT [FK_DimProduct_DimProductSubcategory] FOREIGN KEY([ProductSubcategoryKey])
	REFERENCES [CH01-01-Dimension].[DimProductSubcategory] ([ProductSubcategoryKey])
	--

	ALTER TABLE [CH01-01-Dimension].[DimProduct] CHECK CONSTRAINT [FK_DimProduct_DimProductSubcategory]
END;
