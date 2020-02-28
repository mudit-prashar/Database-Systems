-- =============================================
-- Author:		Dylan Rambarran
-- Procedure:	Process.usp_LoadOrderDetails
-- Create date: 11/14/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[DimGender] from [FileUpload].[OriginallyLoadedData]
-- =============================================
CREATE PROCEDURE Process.usp_LoadOrderDate @UAK INT
AS
INSERT INTO [CH01-01-Dimension].[DimOrderDate] (
	OrderDate
	,MonthName
	,MonthNumber
	,Year
	,UserAuthorizationKey
	)
SELECT DISTINCT OrderDate
	,MonthName
	,MonthNumber
	,Year
	,@UAK
FROM [FileUpload].[OriginallyLoadedData];