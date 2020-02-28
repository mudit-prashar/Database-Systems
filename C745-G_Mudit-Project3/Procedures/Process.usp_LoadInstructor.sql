-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_LoadInstructor
-- Create date: 12/7/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[DimCustomer] from [FileUpload].[OriginallyLoadedData]
-- =============================================

CREATE PROCEDURE Process.usp_LoadInstructor @UserAuthKey INT
AS
	INSERT INTO [Cuny].[Instructor] (InstructorLastName,InstructorFirstName,ClassTime,LastName,FirstName,QmailEmailAddress,AuthorizationUserId) 
	SELECT DISTINCT
	CASE 
		WHEN CHARINDEX(',' ,CS.[Instructor]) > 1 THEN substring(CS.[Instructor], 1, charindex(',', CS.[Instructor])-'1')
		ELSE 'TBD'
	END AS InstructorLastName, 
	CASE 
		WHEN CHARINDEX(',' ,CS.[Instructor]) > 1 THEN substring(CS.[Instructor], CHARINDEX(',' ,CS.[Instructor])+1 , len(CS.[Instructor])-1)
		ELSE 'TBD'
	END AS InstructorFirstName,
	UA.ClassTime,
	UA.LastName,
	UA.FirstName,
	UA.QmailEmailAddress,
	@UserAuthKey AS AuthorizationUserId
	FROM [Uploadfile].[CoursesSpring2019] AS CS
	INNER JOIN [DbSecurity].[UserAuthorization] AS UA
		ON @UserAuthKey = UA.AuthorizationUserId
