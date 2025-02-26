USE [BIClass]
GO
/****** Object:  StoredProcedure [Process].[usp_LoadFactData]    Script Date: 11/17/2019 10:56:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================= 
-- Author:    Dylan Rambarran 
-- Procedure:  Process.usp_LoadFactData 
-- Create date: 11/16/2019 
-- Description:  Loads Customer Info into [CH01-01-Fact].[Data] from [FileUpload].[OriginallyLoadedData] 
-- ============================================= 
Create PROCEDURE [Process].[usp_LoadFactData] @UserAuthKey INT 
AS 
       INSERT INTO [CH01-01-Fact].Data
	(SalesManagerKey, OccupationKey,
	TerritoryKey, ProductKey, CustomerKey,
	ProductCategory, SalesManager, ProductSubcategory, ProductCode,ProductName,Color,ModelName,OrderQuantity,UnitPrice,
	ProductStandardCost, SalesAmount,OrderDate, MonthName, MonthNumber, Year, CustomerName, MaritalStatus, Gender, Education,
	Occupation,TerritoryRegion, TerritoryCountry,TerritoryGroup,UserAuthorizationKey)
SELECT
	sm.SalesManagerKey,do.OccupationKey,
	dt.TerritoryKey, dp.ProductKey, dc.CustomerKey,
	old.ProductCategory, old.SalesManager, old.ProductSubcategory, old.ProductCode,old.ProductName,old.Color,old.ModelName,old.OrderQuantity,old.UnitPrice,
	old.ProductStandardCost, old.SalesAmount,old.OrderDate, old.MonthName, old.MonthNumber, old.Year, old.CustomerName, old.MaritalStatus, old.Gender, old.Education,
	old.Occupation,old.TerritoryRegion, old.TerritoryCountry,old.TerritoryGroup,@UserAuthKey
FROM
	FileUpload.OriginallyLoadedData AS old INNER JOIN
	[CH01-01-Dimension].DimProduct as dp
		ON dp.ProductName = old.ProductName INNER JOIN
	[CH01-01-Dimension].DimTerritory as dt
		ON dt.TerritoryCountry = old.TerritoryCountry AND
			dt.TerritoryGroup = old.TerritoryGroup AND
			dt.TerritoryRegion = old.TerritoryRegion INNER JOIN
	[CH01-01-Dimension].DimCustomer AS dc
		on dc.CustomerName = old.CustomerName INNER JOIN
	[CH01-01-Dimension].[DimOccupation]  AS do
		on old.Occupation = do.Occupation INNER JOIN
	[CH01-01-Dimension].SalesManagers as sm
		on old.ProductCategory = sm.Category
		