-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_LoadMaritalStatus
-- Create date: 11/14/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[DimGender] from [FileUpload].[OriginallyLoadedData]
-- =============================================

CREATE PROCEDURE Process.usp_LoadMaritalStatus @UserAuthKey INT
AS
	INSERT INTO [CH01-01-Dimension].[DimMaritalStatus] (MaritalStatus,MaritalStatusDescription,UserAuthorizationKey)
	SELECT DISTINCT MaritalStatus,MaritalStatusDescription = CASE MaritalStatus WHEN 'M' THEN 'Married' ELSE 'Single' END, @UserAuthKey FROM [FileUpload].[OriginallyLoadedData];