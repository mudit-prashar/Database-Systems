-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_LoadGender
-- Create date: 11/14/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[DimGender] from [FileUpload].[OriginallyLoadedData]
-- =============================================

CREATE PROCEDURE Process.usp_LoadGender @UserAuthKey INT
AS
	INSERT INTO [CH01-01-Dimension].[DimGender] (Gender,GenderDescription,UserAuthorizationKey)
	SELECT DISTINCT Gender,GenderDescription = CASE Gender WHEN 'F' THEN 'Female' ELSE 'Male' END, @UserAuthKey FROM [FileUpload].[OriginallyLoadedData];