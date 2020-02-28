if OBJECT_ID('[Process].[usp_LoadDepartment]') is not null 
DROP PROCEDURE [Process].[usp_LoadDepartment]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar
-- Procedure:	Process.usp_LoadDepartment
-- Create date: 12/10/2019
-- Description:	Loads department abbreviations from upload.CourseSpring2019
-- =============================================

CREATE PROCEDURE [Process].[usp_LoadDepartment] @UserAuthKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [Cuny].[Department] (DepartmentAbbreviation,ClassTime,LastName,FirstName,QmailEmailAddress,AuthorizationUserId)
		Select Distinct
		CASE 
					WHEN len(a.[Course (hr, crd)]) > 1 THEN Substring(a.[Course (hr, crd)], 1, 4)
					ELSE 'TBD'
		END AS DepartmentAbbreviation,
		UA.ClassTime,
		UA.LastName,
		UA.FirstName,
		UA.QmailEmailAddress,
		@UserAuthKey AS AuthorizationUserId
		From Uploadfile.CoursesSpring2019 as a
		INNER JOIN DbSecurity.UserAuthorization as UA
		on @UserAuthKey = UA.AuthorizationUserId
		Order By DepartmentAbbreviation

END