USE [BIClass]
GO
if OBJECT_ID('[Process].[usp_Load_DimProductSubCategory]') is not null 
DROP PROCEDURE [Process].[usp_Load_DimProductSubCategory]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar
-- Procedure:	Process.usp_Load_DimProductSubCategory
-- Create date: 11/16/2019
-- Description:	Loads Product SubCategory info into [CH01-01-Dimension].[DimProductSubCategory] from [FileUpload].[OriginallyLoadedData]
-- =============================================

CREATE PROCEDURE [Process].[usp_Load_DimProductSubCategory] @UserAuthKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [CH01-01-Dimension].DimProductSubcategory(ProductCategoryKey,ProductSubcategory,UserAuthorizationKey)
	SELECT DISTINCT dpc.ProductCategoryKey, ProductSubcategory, @UserAuthKey FROM [FileUpload].[OriginallyLoadedData] as datafile
	INNER JOIN [CH01-01-Dimension].DimProductCategory as dpc 
	ON dpc.ProductCategory = datafile.ProductCategory
	ORDER BY datafile.ProductSubcategory;

END