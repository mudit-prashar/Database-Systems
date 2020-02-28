-- =============================================
-- Author:    Dylan Rambarran
-- Procedure:  Process.usp_LoadSemester
-- Create date: 12/10/2019
-- Description:  Loads Customer Info into [Cuny].[Semester] from Uploadfile.CoursesSpring2019
-- =============================================
CREATE PROCEDURE Process.usp_LoadSemester AS
INSERT INTO [Cuny].[Semester] (SemesterSession, SemesterYear, ClassTime, LastName, FirstName, QmailEmailAddress, DateAdded, DateOfLastUpdated, AuthorizationUserId)
SELECT DISTINCT	
				SUBSTRING(a.Semester, 1, 6) as SemesterSession,
				SUBSTRING(a.Semester, 8, 4) as SemesterYear,
				ua.ClassTime,
				ua.LastName,
				ua.FirstName,
				ua.QmailEmailAddress,
				SYSDATETIME() as DateUpdated,
				SYSDATETIME() as DateOfLastUpdated,
				ua.AuthorizationUserId
FROM Uploadfile.CoursesSpring2019 as a
INNER JOIN DbSecurity.UserAuthorization AS ua ON ua.AuthorizationUserId = 41

