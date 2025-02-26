USE [BIClass]
GO

if OBJECT_ID('[Process].[usp_TruncateStarSchemaData]') is not null 
DROP PROCEDURE [Process].[usp_TruncateStarSchemaData]
GO 
/****** Object:  StoredProcedure [Project2].[TruncateStarSchemaData]    Script Date: 11/16/2019 5:50:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mudit Prashar
-- Procedure:	Process.usp_TruncateStarSchemaData
-- Create date: 11/16/19
-- Description:	Truncates all the tables except fileupload
-- =============================================
CREATE PROCEDURE [Process].[usp_TruncateStarSchemaData]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 -- Insert statements for procedure here
		truncate table [CH01-01-Fact].data;
		truncate table [CH01-01-Dimension].SalesManagers;
		truncate table [CH01-01-Dimension].DimGender;
		truncate table [CH01-01-Dimension].DimMaritalStatus;
		truncate table [CH01-01-Dimension].DimOccupation;
		truncate table [CH01-01-Dimension].DimOrderDate;
		truncate table [CH01-01-Dimension].DimTerritory;
		truncate table [CH01-01-Dimension].DimProduct;
		truncate table [CH01-01-Dimension].DimCustomer;
end
