-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_TrackWorkFlow
-- Create date: 12/9/2019
-- Description:	Tracks workflow steps from stored procedures.
-- =============================================

CREATE PROCEDURE Process.usp_TrackWorkFlow @StartTime DATETIME2, @WorkFlowDescription NVARCHAR(100), @WorkFlowStepTableRowCount INT, @UserAuthorization INT
AS
	INSERT INTO [Process].[WorkflowSteps] (WorkFlowStepDescription, WorkFlowStepTableRowCount,LastName,FirstName,StartingDateTime,ClassTime,QmailEmailAddress, AuthorizationUserId)
	SELECT @WorkFlowDescription,
		@WorkFlowStepTableRowCount,
		LastName,
		FirstName,
		@StartTime,
		ClassTime,
		QmailEmailAddress,
		@UserAuthorization
	FROM [DbSecurity].[UserAuthorization]
	WHERE AuthorizationUserId = @UserAuthorization
	
