if OBJECT_ID('[Process].[Course]') is not null 
DROP PROCEDURE [Process].[Course]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar
-- Procedure:	Process.Course
-- Create date: 12/10/2019
-- Description:	Loads Course description from Department table and Upload.CourseSpring2019 tables
-- =============================================

CREATE PROCEDURE [Process].[Course] @UserAuthKey INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [Cuny].[Course] (CourseDescriptionId,DepartmentId,CourseLevel,CourseHours,CourseCredit, ClassTime,LastName,FirstName,QmailEmailAddress,AuthorizationUserId)
		SELECT DISTINCT 
			cd.CourseDescriptionId,
			d.DepartmentId, 
                CASE 
                  WHEN Len(a.[course (hr, crd)]) > 1 THEN 
                  Substring(a.[course (hr, crd)], 
                  Charindex (' ', a.[course (hr, crd)]) + 1, 
                  Charindex ('(', a.[course (hr, crd)]) - ( 
                  Charindex (' ', a.[course (hr, crd)]) + 
                                                          1 )) 
                  ELSE 'TBD' 
                END AS CourseLevel, 
                CASE
				  WHEN Substring(a.[course (hr, crd)], 
                  Charindex ('(', a.[course (hr, crd)]) + 1, 1) = '.' THEN 
				  Substring(a.[course (hr, crd)], 
                  Charindex ('(', a.[course (hr, crd)]) + 2, 1)
				   WHEN Len(a.[course (hr, crd)]) > 1 THEN 
                  Substring(a.[course (hr, crd)], 
                  Charindex ('(', a.[course (hr, crd)]) + 1, 1)
                  ELSE 0 
                END AS CourseHours, 
                CASE 
                  WHEN Len(a.[course (hr, crd)]) > 1 THEN 
                  Substring(a.[course (hr, crd)], 
                  Charindex (')', a.[course (hr, crd)]) - 1, 1) 
                  ELSE 0 
                END AS CourseCredit,
				ua.ClassTime,
				ua.LastName,
				ua.FirstName,
				ua.QmailEmailAddress,
				@UserAuthKey as AuthorizationUserId
FROM   uploadfile.coursesspring2019 AS a 
	   INNER JOIN DbSecurity.UserAuthorization as UA
		on @UserAuthKey = UA.AuthorizationUserId
       INNER JOIN cuny.department AS d 
               ON d.departmentabbreviation = Substring(a.[course (hr, crd)], 1, 
                                             4) 
       INNER JOIN cuny.coursedescription AS cd 
               ON cd.coursedescription = a.description 
ORDER  BY courselevel 
END