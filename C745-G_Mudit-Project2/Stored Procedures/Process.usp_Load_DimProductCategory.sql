USE [BIClass]
GO
if OBJECT_ID('[Process].[usp_Load_DimProductCategory]') is not null 
DROP PROCEDURE [Process].[usp_Load_DimProductCategory]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar
-- Procedure:	Process.usp_Load_DimProductCategory
-- Create date: 11/16/2019
-- Description:	Loads Product Categories into [CH01-01-Dimension].[DimProductCategory] from [FileUpload].[OriginallyLoadedData]
-- =============================================

CREATE PROCEDURE [Process].[usp_Load_DimProductCategory] @UserAuthKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [CH01-01-Dimension].DimProductCategory(ProductCategory,UserAuthorizationKey)
	SELECT DISTINCT ProductCategory, @UserAuthKey FROM [FileUpload].[OriginallyLoadedData];

END