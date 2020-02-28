-- =============================================
-- Author:    Dylan Rambarran
-- Procedure:  Process.usp_LoadRoom
-- Create date: 12/10/2019
-- Description:  Loads Customer Info into [Cuny].[Room] from Uploadfile.CoursesSpring2019
-- =============================================
CREATE PROCEDURE Process.usp_LoadRoom AS
INSERT INTO [Cuny].[Room] (BuildingId, RoomCode, ClassTime, LastName, FirstName, QmailEmailAddress, DateAdded, DateOfLastUpdated, AuthorizationUserId)
SELECT DISTINCT	b.BuildingId,
				CASE 
					WHEN len(a.Location) > 1 THEN SUBSTRING(a.Location, 3,5)
					ELSE 'TBD'
				END AS RoomCode,
				ua.ClassTime,
				ua.LastName,
				ua.FirstName,
				ua.QmailEmailAddress,
				SYSDATETIME() as DateAdded,
				SYSDATETIME() as DateOfLastUpdated,
				ua.AuthorizationUserId
FROM Uploadfile.CoursesSpring2019 as a
INNER JOIN DbSecurity.UserAuthorization AS ua ON ua.AuthorizationUserId = 41
INNER JOIN Cuny.Building as b ON SUBSTRING(a.Location, 1,2) = b.BuildingAbbreviation
