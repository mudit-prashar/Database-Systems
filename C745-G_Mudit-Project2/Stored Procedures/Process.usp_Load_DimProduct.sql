USE BIClass
GO
IF OBJECT_ID('[Process].[usp_Load_DimProduct]') is not null
DROP PROCEDURE [Process].[usp_Load_DimProduct]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar
-- Procedure:	Process.usp_Load_DimProduct
-- Create date: 11/16/19
-- Description:	Load the data from fileupload to dimProduct
-- =============================================
CREATE PROCEDURE [Process].[usp_Load_DimProduct] @UserAuthKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		INSERT INTO [CH01-01-Dimension].DimProduct(ProductSubcategoryKey,ProductCategory,ProductSubcategory,ProductCode,ProductName,ModelName,Color, UserAuthorizationKey )
		SELECT DISTINCT dps.ProductSubcategoryKey
			,dpc.ProductCategory
			,dps.ProductSubcategory
			,datafile.ProductCode
			,datafile.ProductName
			,datafile.Color
			,datafile.ModelName
			,@UserAuthKey
		FROM [FileUpload].[OriginallyLoadedData] as datafile
		INNER JOIN [CH01-01-Dimension].DimProductCategory as dpc 
		ON dpc.ProductCategory = datafile.ProductCategory
		INNER JOIN [CH01-01-Dimension].[DimProductSubcategory] as dps
		on dpc.ProductCategoryKey = dps.ProductCategoryKey
END
GO
