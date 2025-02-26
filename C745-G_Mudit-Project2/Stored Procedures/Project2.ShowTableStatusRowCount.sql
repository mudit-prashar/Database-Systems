USE [BIClass]
GO
/****** Object:  StoredProcedure [Project2].[ShowTableStatusRowCount]    Script Date: 11/17/2019 2:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [Project2].[ShowTableStatusRowCount] 
@TableStatus VARCHAR(64)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimCustomer', COUNT(*) FROM [CH01-01-Dimension].DimCustomer
	UNION
	select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimGender', COUNT(*) FROM [CH01-01-Dimension].DimGender
	UNION
	select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimMaritalStatus', COUNT(*) FROM [CH01-01-Dimension].DimMaritalStatus
	UNION
	select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimOccupation', COUNT(*) FROM [CH01-01-Dimension].DimOccupation
	UNION
	select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimOrderDate', COUNT(*) FROM [CH01-01-Dimension].DimOrderDate
	UNION
	select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimProduct', COUNT(*) FROM [CH01-01-Dimension].DimProduct
	UNION
	select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimTerritory', COUNT(*) FROM [CH01-01-Dimension].DimTerritory
	UNION
	select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.SalesManagers', COUNT(*) FROM [CH01-01-Dimension].SalesManagers
	UNION
	select TableStatus = @TableStatus, TableName ='CH01-01-Fact.Data', COUNT(*) FROM [CH01-01-Fact].Data
	if OBJECT_ID('[CH01-01-Dimension].[DimProductCategory]') is not null 
	BEGIN
		select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimProductCategory', COUNT(*) FROM [CH01-01-Dimension].DimProductCategory
		UNION
		select TableStatus = @TableStatus, TableName ='CH01-01-Dimension.DimProductSubcategory', COUNT(*) FROM [CH01-01-Dimension].DimProductSubcategory
	END

END