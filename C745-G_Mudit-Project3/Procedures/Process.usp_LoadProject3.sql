IF OBJECT_ID('Process.usp_LoadProject3') IS NOT NULL
	DROP PROCEDURE Process.usp_LoadProject3
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE Process.usp_LoadProject3
AS
BEGIN
--Use this as guide on how to attach with your workflowsteps
DECLARE @CurrentRowCount INT = 0;
--each procedure follows this format
DECLARE @StartTime DATETIME2 = sysdatetime();

EXEC [Process].[usp_LoadUserAuthorization]

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load UserAuthorization Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 41;

SET @StartTime = SYSDATETIME();

EXEC Process.usp_LoadInstructor @UserAuthKey = 36

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load Instructor Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 36;

SET @StartTime = SYSDATETIME();

EXEC Process.usp_InstructionMode @UserAuthKey = 36

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load Instruction Mode Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 36;

SET @StartTime = SYSDATETIME();

EXEC process.[usp_LoadDepartment] @UserAuthKey = 69

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load Department Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 69;

SET @StartTime = SYSDATETIME();

EXEC [Process].[CourseDescription] @UserAuthKey = 69

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load CourseDescription Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 69;

SET @StartTime = SYSDATETIME();

EXEC [Process].[Course] @UserAuthKey = 69

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load Course Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 69;

SET @StartTime = SYSDATETIME();

EXEC Process.usp_LoadSemester

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load Semester Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 41;

SET @StartTime = SYSDATETIME();

EXEC Process.usp_LoadBuilding

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load Building Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 41;

SET @StartTime = SYSDATETIME();

EXEC Process.usp_LoadRoom

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load Room Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 41;

SET @StartTime = SYSDATETIME();

EXEC Process.usp_LoadClass

SET @CurrentRowCount = @@ROWCOUNT

EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime
	,@WorkFlowDescription = 'Load Class Table'
	,@WorkFlowStepTableRowCount = @CurrentRowCount
	,@UserAuthorization = 41;

END;