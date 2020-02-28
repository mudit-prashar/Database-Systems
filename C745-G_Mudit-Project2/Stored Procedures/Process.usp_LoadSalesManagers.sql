-- =============================================
-- Author:		Dylan Rambarran
-- Procedure:	Process.usp_LoadSalesManagers
-- Create date: 11/15/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[SalesManagers] from [FileUpload].[OriginallyLoadedData]
-- =============================================
CREATE PROCEDURE Process.usp_LoadSalesManagers @UAK INT
AS
INSERT INTO [CH01-01-Dimension].[SalesManagers] (
	Category
	,SalesManager
	,Office
	,UserAuthorizationKey
	)
SELECT DISTINCT ProductCategory
	,SalesManager
	,Office = CASE 
		WHEN SalesManager LIKE 'Marco%'
			THEN 'Redmond'
		WHEN SalesManager LIKE 'Alberto%'
			THEN 'Seattle'
		WHEN SalesManager LIKE 'Maurizio%'
			THEN 'Redmond'
		ELSE 'Seattle'
		END
	,@UAK
FROM [FileUpload].[OriginallyLoadedData];
