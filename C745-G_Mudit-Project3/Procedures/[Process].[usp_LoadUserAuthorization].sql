-- =============================================
-- Author:		Dylan Rambarran
-- Procedure:  [Process].[usp_LoadUserAuthorization]
-- Create date: 12/6/2019
-- Description:	Loads the group's information into the [DbSecurity].[UserAuthorization] table
-- =============================================
CREATE PROCEDURE [Process].[usp_LoadUserAuthorization]
AS
INSERT INTO [DbSecurity].[UserAuthorization] (
	AuthorizationUserId
	,ClassTime
	,LastName
	,FirstName
	,DateAdded
	,QmailEmailAddress
	)
VALUES (
	69
	,'7:45'
	,'Prashar'
	,'Mudit'
	,sysdatetime()
	,'mudit.prashar69@qmail.cuny.edu'
	)
	,(
	36
	,'7:45'
	,'Jimenez'
	,'Thomas'
	,sysdatetime()
	,'thomas.jimenez36@qmail.cuny.edu'
	)
	,(
	41
	,'7:45'
	,'Rambarran'
	,'Dylan'
	,sysdatetime()
	,'dylan.rambarran41@qmail.cuny.edu'
	);