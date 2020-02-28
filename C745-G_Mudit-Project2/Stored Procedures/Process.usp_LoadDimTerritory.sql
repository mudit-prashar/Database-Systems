-- =============================================
-- Author:		Dylan Rambarran
-- Procedure:	Process.usp_LoadDimTerritory
-- Create date: 11/15/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[DimGender] from [FileUpload].[OriginallyLoadedData]
-- =============================================
CREATE PROCEDURE Process.usp_LoadDimTerritory @UAK INT
AS
INSERT INTO [CH01-01-Dimension].[DimTerritory] (
	TerritoryGroup
	,TerritoryCountry
	,TerritoryRegion
	,UserAuthorizationKey
	)
SELECT DISTINCT TerritoryGroup
	,TerritoryCountry
	,TerritoryRegion
	,@UAK
FROM [FileUpload].[OriginallyLoadedData];
