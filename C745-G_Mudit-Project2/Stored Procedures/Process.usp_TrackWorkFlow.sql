-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_TrackWorkFlow
-- Create date: 11/16/2019
-- Description:	Tracks workflow steps from stored procedures.
-- =============================================

CREATE PROCEDURE Process.usp_TrackWorkFlow @StartTime DATETIME2, @WorkFlowDescription NVARCHAR(100), @WorkFlowStepTableRowCount INT, @UserAuthorization INT
AS
	INSERT INTO [Process].[WorkflowSteps] (WorkFlowStepDescription, WorkFlowStepTableRowCount,StartingDateTime, UserAuthorizationKey)
	VALUES(@WorkFlowDescription,@WorkFlowStepTableRowCount,@StartTime,@UserAuthorization);
