-- =============================================
-- Author:		Dylan Rambarran
-- Procedure:	Process.usp_ShowWorkflowSteps
-- Create date: 11/16/2019
-- Description:	Shows the contents of the Process.WorkflowSteps table
-- =============================================
CREATE PROCEDURE Process.usp_ShowWorkflowSteps
AS
SELECT * FROM Process.WorkflowSteps; 
