-- =============================================
-- Author:    Dylan Rambarran
-- Procedure:  Process.usp_LoadBuilding
-- Create date: 12/10/2019
-- Description:  Loads Customer Info into [Cuny].[Building] from Uploadfile.CoursesSpring2019
-- =============================================

CREATE PROCEDURE Process.usp_LoadBuilding AS
INSERT INTO [Cuny].[Building] (BuildingAbbreviation, ClassTime, LastName, FirstName, QmailEmailAddress, DateAdded, DateOfLastUpdated, AuthorizationUserId)
SELECT DISTINCT	
				CASE 
					WHEN len(a.Location) > 1 THEN SUBSTRING(a.Location, 1,2)
					ELSE 'TBD'
				END AS BuildingAbbreviation,
				ua.ClassTime,
				ua.LastName,
				ua.FirstName,
				ua.QmailEmailAddress,
				SYSDATETIME() as DateUpdated,
				SYSDATETIME() as DateOfLastUpdated,
				ua.AuthorizationUserId
FROM Uploadfile.CoursesSpring2019 as a
INNER JOIN DbSecurity.UserAuthorization AS ua ON ua.AuthorizationUserId = 41

