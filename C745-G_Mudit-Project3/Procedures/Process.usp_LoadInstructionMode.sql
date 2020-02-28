-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_LoadInstructionMode
-- Create date: 12/7/2019
-- Description:	Loads Customer Info into [CH01-01-Dimension].[DimCustomer] from [FileUpload].[OriginallyLoadedData]
-- =============================================

CREATE PROCEDURE Process.usp_InstructionMode @UserAuthKey INT
AS
	INSERT INTO [Cuny].[InstructionMode] (InstructionMode,ClassTime,LastName,FirstName,QmailEmailAddress,AuthorizationUserId) 
		SELECT DISTINCT 
		CASE 
			WHEN len(CS.[Mode of Instruction]) > 1 THEN CS.[Mode of Instruction]
			ELSE 'TBD'
		END AS InstructionMode,
		UA.ClassTime,
		UA.LastName,
		UA.FirstName,
		UA.QmailEmailAddress,
		@UserAuthKey AS AuthorizationUserId
		FROM [Uploadfile].[CoursesSpring2019] AS CS
		INNER JOIN [DbSecurity].[UserAuthorization] AS UA
			ON @UserAuthKey = UA.AuthorizationUserId