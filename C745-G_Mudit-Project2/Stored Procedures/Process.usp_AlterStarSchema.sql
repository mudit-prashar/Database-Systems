
-- =============================================
-- Author:		Thomas Jimenez
-- Procedure:	Process.usp_AlterStarSchema
-- Create date: 11/16/19
-- Description:	Truncates all the tables except fileupload
-- =============================================
CREATE PROCEDURE [Process].[usp_AlterStarSchema] 
AS 

--DimCustomer Sequence Object
CREATE SEQUENCE PkSequence.DimCustomerSequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  
 

--DimOccupation Sequence Object
CREATE SEQUENCE PkSequence.DimOccupationSequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  
  


--DimProduct Sequence Object
CREATE SEQUENCE PkSequence.DimProductSequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  


--DimProductCategory Sequence Object
CREATE SEQUENCE PkSequence.DimProductCategorySequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  


--DimProductSubcategory Sequence Object
CREATE SEQUENCE PkSequence.DimProductSubcategorySequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  
  

--DimTerritorySequenceObject Sequence Object
CREATE SEQUENCE PkSequence.DimTerritorySequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  
  

--SalesManagers Sequence Object
CREATE SEQUENCE PkSequence.SalesManagersSequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  


--Data Sequence Object
CREATE SEQUENCE PkSequence.DataSequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  
  

--UserAuthorization Object
CREATE SEQUENCE PkSequence.UserAuthorizationSequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  
  

--WorkflowStepsSequence Object
CREATE SEQUENCE PkSequence.WorkflowStepsSequenceObject
	AS INT
    START WITH 1  
    INCREMENT BY 1;  
 

--Add 4 New Tables

/****** Object:  Table [CH01-01-Dimension].[DimProductCategory]    Script Date: 11/16/2019 11:09:38 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [CH01-01-Dimension].[DimProductCategory](
	[ProductCategoryKey] [int] NOT NULL,
	[ProductCategory] [varchar](20) NOT NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [CH01-01-Dimension].[DimProductSubcategory]    Script Date: 11/16/2019 11:09:38 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [CH01-01-Dimension].[DimProductSubcategory](
	[ProductSubcategoryKey] [int] NOT NULL,
	[ProductCategoryKey] [int] NOT NULL,
	[ProductSubcategory] [varchar](20) NOT NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL,
	[DateOfLastUpdate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [DbSecurity].[UserAuthorization]    Script Date: 11/16/2019 11:09:38 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [DbSecurity].[UserAuthorization](
	[UserAuthorizationKey] [int] NOT NULL,
	[ClassTime] [nchar](5) NULL,
	[IndividualProject] [nvarchar](60) NULL,
	[GroupMemberLastName] [nvarchar](35) NOT NULL,
	[GroupMemberFirstName] [nvarchar](25) NOT NULL,
	[DateAdded] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAuthorizationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [Process].[WorkflowSteps]    Script Date: 11/16/2019 11:09:38 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [Process].[WorkflowSteps](
	[WorkFlowStepKey] [int] NOT NULL,
	[WorkFlowStepDescription] [nvarchar](100) NOT NULL,
	[WorkFlowStepTableRowCount] [int] NULL,
	[StartingDateTime] [datetime2](7) NULL,
	[EndingDateTime] [datetime2](7) NULL,
	[ClassTime] [char](5) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkFlowStepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [CH01-01-Dimension].[DimProductCategory] ADD  DEFAULT (NEXT VALUE FOR [PkSequence].[DimProductCategorySequenceObject]) FOR [ProductCategoryKey]

ALTER TABLE [CH01-01-Dimension].[DimProductCategory] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]

ALTER TABLE [CH01-01-Dimension].[DimProductCategory] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]

ALTER TABLE [CH01-01-Dimension].[DimProductSubcategory] ADD  DEFAULT (NEXT VALUE FOR [PkSequence].[DimProductSubcategorySequenceObject]) FOR [ProductSubcategoryKey]

ALTER TABLE [CH01-01-Dimension].[DimProductSubcategory] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]

ALTER TABLE [CH01-01-Dimension].[DimProductSubcategory] ADD  DEFAULT (sysdatetime()) FOR [DateOfLastUpdate]

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT (NEXT VALUE FOR [PkSequence].[UserAuthorizationSequenceObject]) FOR [UserAuthorizationKey]

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('7:45') FOR [ClassTime]

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT ('PROJECT 2 RECREATE THE BICLASS DATABASE STAR SCHEMA') FOR [IndividualProject]

ALTER TABLE [DbSecurity].[UserAuthorization] ADD  DEFAULT (sysdatetime()) FOR [DateAdded]

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT (NEXT VALUE FOR [PkSequence].[WorkflowStepsSequenceObject]) FOR [WorkFlowStepKey]

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT ((0)) FOR [WorkFlowStepTableRowCount]

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [StartingDateTime]

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT (sysdatetime()) FOR [EndingDateTime]

ALTER TABLE [Process].[WorkflowSteps] ADD  DEFAULT ('07:45') FOR [ClassTime]

ALTER TABLE [CH01-01-Dimension].[DimProductSubcategory]  WITH CHECK ADD FOREIGN KEY([ProductCategoryKey])
REFERENCES [CH01-01-Dimension].[DimProductCategory] ([ProductCategoryKey])
ON DELETE CASCADE


--Alt alter (drop existing tables and add new tables with proper order)

DROP TABLE [CH01-01-Dimension].[DimCustomer];

/****** Object:  Table [CH01-01-Dimension].[DimCustomer]    Script Date: 11/14/2019 1:38:13 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [CH01-01-Dimension].[DimCustomer](
	[CustomerKey] [int] NOT NULL DEFAULT NEXT VALUE FOR PkSequence.DimCustomerSequenceObject,
	[CustomerName] [varchar](30) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL DEFAULT(sysdatetime()) ,
	[DateOfLastUpdate] [datetime2](7) NULL DEFAULT(sysdatetime()),
 CONSTRAINT [PK__DimCusto__95011E6452BCF41C] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


DROP TABLE [CH01-01-Dimension].[DimOccupation];

/****** Object:  Table [CH01-01-Dimension].[DimOccupation]    Script Date: 11/14/2019 1:38:13 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [CH01-01-Dimension].[DimOccupation](
	[OccupationKey] [int] NOT NULL DEFAULT NEXT VALUE FOR PkSequence.DimOccupationSequenceObject,
	[Occupation] [varchar](20) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL DEFAULT(sysdatetime()),
	[DateOfLastUpdate] [datetime2](7) NULL DEFAULT(sysdatetime()),
 CONSTRAINT [PK_DimOccupation] PRIMARY KEY CLUSTERED 
(
	[OccupationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


DROP TABLE [CH01-01-Dimension].[DimProduct];

/****** Object:  Table [CH01-01-Dimension].[DimProduct]    Script Date: 11/14/2019 1:38:13 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [CH01-01-Dimension].[DimProduct](
	[ProductKey] [int] NOT NULL DEFAULT NEXT VALUE FOR PkSequence.DimProductSequenceObject,
	[ProductSubcategoryKey] [int] NULL,
	[ProductCategory] [varchar](20) NULL,
	[ProductSubcategory] [varchar](20) NULL,
	[ProductCode] [varchar](10) NULL,
	[ProductName] [varchar](40) NULL,
	[Color] [varchar](10) NULL,
	[ModelName] [varchar](30) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL DEFAULT(sysdatetime()),
	[DateOfLastUpdate] [datetime2](7) NULL DEFAULT(sysdatetime()),
 CONSTRAINT [PK__DimProdu__A15E99B3E27177EF] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


DROP TABLE [CH01-01-Dimension].[DimTerritory];

/****** Object:  Table [CH01-01-Dimension].[DimTerritory]    Script Date: 11/14/2019 1:38:14 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [CH01-01-Dimension].[DimTerritory](
	[TerritoryKey] [int] NOT NULL DEFAULT NEXT VALUE FOR PkSequence.DimTerritorySequenceObject,
	[TerritoryGroup] [varchar](20) NULL,
	[TerritoryCountry] [varchar](20) NULL,
	[TerritoryRegion] [varchar](20) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL DEFAULT(sysdatetime()),
	[DateOfLastUpdate] [datetime2](7) NULL DEFAULT(sysdatetime()),
 CONSTRAINT [PK__DimTerri__C54B735D813BBCA6] PRIMARY KEY CLUSTERED 
(
	[TerritoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


DROP TABLE [CH01-01-Dimension].[SalesManagers];

/****** Object:  Table [CH01-01-Dimension].[SalesManagers]    Script Date: 11/14/2019 1:38:14 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [CH01-01-Dimension].[SalesManagers](
	[SalesManagerKey] [int] NOT NULL DEFAULT NEXT VALUE FOR PkSequence.SalesManagersSequenceObject,
	[Category] [varchar](20) NULL,
	[SalesManager] [varchar](50) NULL,
	[Office] [varchar](50) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL DEFAULT(sysdatetime()),
	[DateOfLastUpdate] [datetime2](7) NULL DEFAULT(sysdatetime()),
 CONSTRAINT [PK_SalesManagers] PRIMARY KEY CLUSTERED 
(
	[SalesManagerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


DROP TABLE [CH01-01-Fact].[Data];

/****** Object:  Table [CH01-01-Fact].[Data]    Script Date: 11/14/2019 1:38:14 PM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [CH01-01-Fact].[Data](
	[SalesKey] [int] NOT NULL DEFAULT NEXT VALUE FOR PkSequence.DataSequenceObject,
	[SalesManagerKey] [int] NULL,
	[OccupationKey] [int] NULL,
	[TerritoryKey] [int] NULL,
	[ProductKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[ProductCategory] [varchar](20) NULL,
	[SalesManager] [varchar](20) NULL,
	[ProductSubcategory] [varchar](20) NULL,
	[ProductCode] [varchar](10) NULL,
	[ProductName] [varchar](40) NULL,
	[Color] [varchar](10) NULL,
	[ModelName] [varchar](30) NULL,
	[OrderQuantity] [int] NULL,
	[UnitPrice] [money] NULL,
	[ProductStandardCost] [money] NULL,
	[SalesAmount] [money] NULL,
	[OrderDate] [date] NULL,
	[MonthName] [varchar](10) NULL,
	[MonthNumber] [int] NULL,
	[Year] [int] NULL,
	[CustomerName] [varchar](30) NULL,
	[MaritalStatus] [char](1) NULL,
	[Gender] [char](1) NULL,
	[Education] [varchar](20) NULL,
	[Occupation] [varchar](20) NULL,
	[TerritoryRegion] [varchar](20) NULL,
	[TerritoryCountry] [varchar](20) NULL,
	[TerritoryGroup] [varchar](20) NULL,
	[UserAuthorizationKey] [int] NOT NULL,
	[DateAdded] [datetime2](7) NULL DEFAULT(sysdatetime()),
	[DateOfLastUpdate] [datetime2](7) NULL DEFAULT(sysdatetime()),
 CONSTRAINT [PK_Data] PRIMARY KEY CLUSTERED 
(
	[SalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--Add User Auth Keys

INSERT INTO [DbSecurity].[UserAuthorization](UserAuthorizationKey,GroupMemberLastName, GroupMemberFirstName)
VALUES (1,'Jimenez', 'Thomas');

INSERT INTO [DbSecurity].[UserAuthorization](UserAuthorizationKey,GroupMemberLastName, GroupMemberFirstName)
VALUES (2,'Prashar', 'Mudit');

INSERT INTO [DbSecurity].[UserAuthorization](UserAuthorizationKey,GroupMemberLastName, GroupMemberFirstName)
VALUES (3,'Rambarran', 'Dylan');

--Changing Length of Field

ALTER TABLE [CH01-01-Dimension].[DimProduct] ALTER COLUMN [ProductCategory] VARCHAR (40)
ALTER TABLE [CH01-01-Dimension].[DimProduct] ALTER COLUMN [ProductSubcategory] VARCHAR (40)
ALTER TABLE [CH01-01-Dimension].[DimProduct] ALTER COLUMN [ProductCode] VARCHAR (40)
ALTER TABLE [CH01-01-Dimension].[DimProduct] ALTER COLUMN [ProductName] VARCHAR (40)
ALTER TABLE [CH01-01-Dimension].[DimProduct] ALTER COLUMN [Color] VARCHAR (40)
ALTER TABLE [CH01-01-Dimension].[DimProduct] ALTER COLUMN [ModelName] VARCHAR (40)


--Adds Necessary Columns
ALTER TABLE [CH01-01-Dimension].[DimGender]
  ADD UserAuthorizationKey int not null,
  DateAdded datetime2 null default(sysdatetime()),
  DateOfLastUpdate datetime2 null default(sysdatetime());


ALTER TABLE [CH01-01-Dimension].[DimMaritalStatus]
  ADD UserAuthorizationKey int not null,
  DateAdded datetime2 null default(sysdatetime()),
  DateOfLastUpdate datetime2 null default(sysdatetime());


ALTER TABLE [CH01-01-Dimension].[DimOrderDate]
  ADD UserAuthorizationKey int not null,
  DateAdded datetime2 null default(sysdatetime()),
  DateOfLastUpdate datetime2 null default(sysdatetime());