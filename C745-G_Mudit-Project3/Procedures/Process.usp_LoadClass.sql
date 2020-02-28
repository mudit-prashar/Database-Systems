-- =============================================
-- Author:    Dylan Rambarran
-- Procedure:  Process.usp_LoadClass
-- Create date: 12/10/2019
-- Description:  Loads Customer Info into [Cuny].[Class] from all tables
-- =============================================

CREATE PROCEDURE Process.usp_LoadClass AS
INSERT INTO [Cuny].[Class] (CourseId, SemesterId, InstructorId, InstructionModeId, RoomId, ClassSection, ClassCode, ClassScheduledDay, ClassStartTime, ClassEndTime, TotalEnrollment, TotalEnrollmentLimit, ClassTime, LastName, FirstName, QmailEmailAddress, AuthorizationUserId)
SELECT DISTINCT C.CourseId, S.SemesterId, I.InstructorId, INM.InstructionModeId, R.RoomId, CS.Sec, CS.Code, CS.[Day], SUBSTRING(CS.[Time], 1, 8) as ClassStartTime, SUBSTRING(CS.[Time], Charindex ('-', CS.Time) + 1, 9) as ClassEndTime, CS.Enrolled, CS.Limit, UA.ClassTime, UA.LastName, UA.FirstName, UA.QmailEmailAddress, UA.AuthorizationUserId
FROM [Uploadfile].[CoursesSpring2019] AS CS
	INNER JOIN [Cuny].[CourseDescription] AS CD
	ON CS.[Description] = CD.CourseDescription
	INNER JOIN [Cuny].[Course] AS C
	ON CD.CourseDescriptionId = C.CourseDescriptionId
	INNER JOIN [Cuny].[Semester] AS S 
	ON CS.Semester = CONCAT(S.[SemesterSession],' ', S.[SemesterYear])
	INNER JOIN [Cuny].[Instructor] AS I
	ON CS.Instructor = CONCAT(I.InstructorLastName,',',I.InstructorFirstName)
	INNER JOIN [Cuny].[InstructionMode] AS INM
	ON CS.[Mode of Instruction] = INM.InstructionMode
	INNER JOIN [Cuny].[Room] AS R
	ON SUBSTRING(CS.Location, 3, 5) = R.RoomCode
	INNER JOIN DbSecurity.UserAuthorization AS UA 
	ON UA.AuthorizationUserId = 41

