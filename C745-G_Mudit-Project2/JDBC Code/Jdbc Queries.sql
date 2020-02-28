
-- =============================================
-- Author:		Thomas Jimenez
-- Create date: 11/16/19
-- Description:	Queries used on JDBC Video
-- =============================================

--Query 1 (LoadStarSchema)

EXEC [Process].[usp_LoadStarSchemaData] @UserAuthKey = 1

--Query 2 (ShowWorkFlowSteps)

EXEC [Process].[usp_ShowWorkflowSteps]

--Query 3 (Show total LoadStarSchema Time in ms)

SELECT WorkFlowStepDescription, DATEDIFF(ms, StartingDateTime, EndingDateTime) AS TotalExecutionTimeInMs
FROM [Process].[WorkflowSteps]
WHERE WorkFlowStepTableRowCount = (SELECT MAX(WorkFlowStepTableRowCount) FROM [Process].[WorkflowSteps]);

--Query 4 (Show Total Stored Procedures and Total Execution Time for Each Group Member in ms)

SELECT CONCAT(UA.GroupMemberFirstName, ' ', UA.GroupMemberLastName) As GroupMember, COUNT(WS.UserAuthorizationKey) AS TotalStoredProcedures, SUM(DATEDIFF(ms, WS.StartingDateTime, WS.EndingDateTime)) TotalExecutionTimeInMs
FROM [Process].[WorkflowSteps] AS WS
INNER JOIN [DbSecurity].[UserAuthorization] AS UA
	ON WS.UserAuthorizationKey = UA.UserAuthorizationKey
WHERE WorkFlowStepTableRowCount <> (SELECT MAX(WorkFlowStepTableRowCount) FROM [Process].[WorkflowSteps])
GROUP BY CONCAT(UA.GroupMemberFirstName, ' ', UA.GroupMemberLastName), WS.UserAuthorizationKey
















SELECT UserAuthorizationKey, DATEDIFF(ms, StartingDateTime, EndingDateTime) FROM [Process].[WorkflowSteps] ORDER BY UserAuthorizationKey

SELECT UserAuthorizationKey, SUM(DATEDIFF(ms, StartingDateTime, EndingDateTime)) FROM [Process].[WorkflowSteps] GROUP BY UserAuthorizationKey


SELECT UserAuthorizationKey, (DATEDIFF(ms, StartingDateTime, EndingDateTime) FROM [Process].[WorkflowSteps] 