-- =============================================
-- Author:		Dylan Rambarran
-- Procedure:	Process.usp_LoadOccupation
-- Create date: 11/15/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[DimOccupation] from [FileUpload].[OriginallyLoadedData]
-- =============================================
CREATE PROCEDURE Process.usp_LoadOccupation @UAK INT
AS
INSERT INTO [CH01-01-Dimension].[DimOccupation] (
	Occupation
	,UserAuthorizationKey
	)
SELECT DISTINCT Occupation
	,@UAK
FROM [FileUpload].[OriginallyLoadedData];