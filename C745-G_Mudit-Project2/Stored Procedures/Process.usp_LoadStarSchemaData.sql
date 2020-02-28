
-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_LoadStarSchema
-- Create date: 11/17/2019
-- Description:	Loads whole star schema from FileUpload.OriginallyLoadedData
-- =============================================

CREATE PROCEDURE Process.usp_LoadStarSchemaData @UserAuthKey INT
AS
DECLARE @LoadStarSchemaStart DATETIME2 = sysdatetime();
DECLARE @InitializeTime DATETIME2 = sysdatetime();
DECLARE @TotalRowCount int = 0;
DECLARE @CurrentRowCount int = 0;

EXEC [Process].[usp_DropForeignKeysFromStarSchemaData];

EXEC  [Project2].[ShowTableStatusRowCount] @TableStatus = 'Pre-truncate row count'

EXEC [Process].[usp_TruncateStarSchemaData];

EXEC [Process].[usp_AlterStarSchema] 

EXEC [Process].[usp_AddForeignKeysToStarSchemaData]

EXEC Process.usp_TrackWorkFlow @StartTime = @InitializeTime, @WorkFlowDescription = 'Initialize Database', @WorkFlowStepTableRowCount = @@ROWCOUNT, @UserAuthorization = 2;
            
--Load Individual Tables

DECLARE @StartTime DATETIME2 = sysdatetime();
EXEC [Process].[usp_Load_DimProductCategory] @UserAuthKey = 2;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load Product Category', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 2;

SET @StartTime = SYSDATETIME();
EXEC  [Process].[usp_Load_DimProductSubCategory] @UserAuthKey = 2;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load Product SubCategory', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 2;

SET @StartTime = SYSDATETIME();
EXEC  [Process].[usp_Load_DimProduct] @UserAuthKey = 2;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load Product', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 2;

--SalesManager
SET @StartTime = SYSDATETIME();
EXEC  [Process].[usp_LoadSalesManagers] @UAK = 3;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load SalesManager', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 3;

--DimGender
SET @StartTime = SYSDATETIME();
EXEC  [Process].[usp_LoadGender] @UserAuthKey = 1;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load Gender', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 1;

--MaritialStatus
SET @StartTime = SYSDATETIME();
EXEC [Process].[usp_LoadMaritalStatus] @UserAuthKey = 1;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load Maritial Status', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 1;

--Occupation
SET @StartTime = SYSDATETIME();
EXEC [Process].[usp_LoadOccupation] @UAK = 3;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load Occupation Status', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 3;

--OrderDate
SET @StartTime = SYSDATETIME();
EXEC Process.usp_LoadOrderDate @UAK = 3;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load OrderDate Status', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 3;

--DimTerritory
SET @StartTime = SYSDATETIME();
EXEC [Process].[usp_LoadDimTerritory]  @UAK = 3;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load DimTerritory Status', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 3;

--LoadCustomer
SET @StartTime = SYSDATETIME();
EXEC [Process].[usp_LoadCustomer] @UserAuthKey = 1;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load Customer Status', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 1;


--LoadData
SET @StartTime = SYSDATETIME();
EXEC [Process].[usp_LoadFactData] @UserAuthKey = 3;
SET @CurrentRowCount = @@ROWCOUNT
SET @TotalRowCount = @TotalRowCount + @CurrentRowCount
EXEC Process.usp_TrackWorkFlow @StartTime = @StartTime, @WorkFlowDescription = 'Load Fact Data Table', @WorkFlowStepTableRowCount = @CurrentRowCount, @UserAuthorization = 3;


EXEC  [Project2].[ShowTableStatusRowCount] @TableStatus = 'Row Count After Loading Star Schema'

EXEC Process.usp_TrackWorkFlow @StartTime = @LoadStarSchemaStart, @WorkFlowDescription = 'Total Load Star Schema Time', @WorkFlowStepTableRowCount = @TotalRowCount, @UserAuthorization = 1;
