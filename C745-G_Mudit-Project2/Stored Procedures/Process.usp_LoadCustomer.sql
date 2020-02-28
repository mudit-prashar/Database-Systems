
-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_LoadCustomer
-- Create date: 11/14/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[DimCustomer] from [FileUpload].[OriginallyLoadedData]
-- =============================================

CREATE PROCEDURE Process.usp_LoadCustomer @UserAuthKey INT
AS
	INSERT INTO [CH01-01-Dimension].[DimCustomer] (CustomerName,UserAuthorizationKey)
	SELECT DISTINCT CustomerName, @UserAuthKey FROM [FileUpload].[OriginallyLoadedData];


