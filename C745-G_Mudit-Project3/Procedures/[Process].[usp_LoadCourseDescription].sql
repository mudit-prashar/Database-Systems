if OBJECT_ID('[Process].[CourseDescription]') is not null 
DROP PROCEDURE [Process].[CourseDescription]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar
-- Procedure:	Process.CourseDescription
-- Create date: 12/10/2019
-- Description:	Loads course description from upload.CourseSpring2019
-- =============================================

CREATE PROCEDURE [Process].[CourseDescription] @UserAuthKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [Cuny].[CourseDescription] (CourseDescription,ClassTime,LastName,FirstName,QmailEmailAddress,AuthorizationUserId)
		Select Distinct
		CASE 
					WHEN len(a.Description) > 1 THEN a.Description
					ELSE 'No Description'
		END AS CourseDescription,
		UA.ClassTime,
		UA.LastName,
		UA.FirstName,
		UA.QmailEmailAddress,
		@UserAuthKey AS AuthorizationUserId
		From Uploadfile.CoursesSpring2019 as a
		INNER JOIN DbSecurity.UserAuthorization as UA
		on @UserAuthKey = UA.AuthorizationUserId
		order by CourseDescription
END