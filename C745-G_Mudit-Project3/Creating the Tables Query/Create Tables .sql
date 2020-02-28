-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [DbSecurity].[UserAuthorization]

CREATE TABLE [DbSecurity].[UserAuthorization]
(
 [AuthorizationUserId] int NOT NULL ,
 [ClassTime]           char(5) NOT NULL CONSTRAINT [UserAuthorization_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]            varchar(30) NOT NULL CONSTRAINT [UserAuthorization_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]           varchar(30) NOT NULL CONSTRAINT [UserAuthorization_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [DateAdded]           datetime2(7) NOT NULL CONSTRAINT [UserAuthorization_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [UserAuthorization_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,


 CONSTRAINT [PK_UserAuthorization] PRIMARY KEY CLUSTERED ([AuthorizationUserId] ASC)
);
GO








-- ************************************** [Cuny].[Semester]

CREATE TABLE [Cuny].[Semester]
(
 [SemesterId]          int IDENTITY (1, 1) NOT NULL ,
 [SemesterSession]     nvarchar(6) NOT NULL ,
 [SemesterYear]        int NOT NULL ,
 [ClassTime]           char(5) NOT NULL CONSTRAINT [Semester_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]            varchar(30) NOT NULL CONSTRAINT [Semester_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]           varchar(30) NOT NULL CONSTRAINT [Semester_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [Semester_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]           datetime2(7) NOT NULL CONSTRAINT [Semester_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]   datetime2(7) NOT NULL CONSTRAINT [Semester_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId] int NOT NULL CONSTRAINT [Semester_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED ([SemesterId] ASC)
);
GO








-- ************************************** [Cuny].[Instructor]

CREATE TABLE [Cuny].[Instructor]
(
 [InstructorId]        int IDENTITY (1, 1) NOT NULL ,
 [InstructorLastName]  nvarchar(30) NOT NULL ,
 [InstructorFirstName] nvarchar(30) NOT NULL ,
 [ClassTime]           char(5) NOT NULL CONSTRAINT [Instructor_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]            varchar(30) NOT NULL CONSTRAINT [Instructor_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]           varchar(30) NOT NULL CONSTRAINT [Instructor_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [Instructor_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]           datetime2(7) NOT NULL CONSTRAINT [Instructor_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]   datetime2(7) NOT NULL CONSTRAINT [Instructor_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId] int NOT NULL CONSTRAINT [Instructor_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED ([InstructorId] ASC)
);
GO








-- ************************************** [Cuny].[InstructionMode]

CREATE TABLE [Cuny].[InstructionMode]
(
 [InstructionModeId]   int IDENTITY (1, 1) NOT NULL ,
 [InstructionMode]     nvarchar(50) NOT NULL ,
 [ClassTime]           char(5) NOT NULL CONSTRAINT [InstructionMode_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]            varchar(30) NOT NULL CONSTRAINT [InstructionMode_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]           varchar(30) NOT NULL CONSTRAINT [InstructionMode_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [InstructionMode_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]           datetime2(7) NOT NULL CONSTRAINT [InstructionMode_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]   datetime2(7) NOT NULL CONSTRAINT [InstructionMode_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId] int NOT NULL CONSTRAINT [InstructionMode_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_InstructionMode] PRIMARY KEY CLUSTERED ([InstructionModeId] ASC)
);
GO








-- ************************************** [Cuny].[Department]

CREATE TABLE [Cuny].[Department]
(
 [DepartmentId]           int IDENTITY (1, 1) NOT NULL ,
 [DepartmentAbbreviation] nvarchar(10) NOT NULL ,
 [ClassTime]              char(5) NOT NULL CONSTRAINT [Department_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]               varchar(30) NOT NULL CONSTRAINT [Department_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]              varchar(30) NOT NULL CONSTRAINT [Department_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [Department_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]              datetime2(7) NOT NULL CONSTRAINT [Department_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]      datetime2(7) NOT NULL CONSTRAINT [Department_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId]    int NOT NULL CONSTRAINT [Department_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([DepartmentId] ASC)
);
GO








-- ************************************** [Cuny].[CourseDescription]

CREATE TABLE [Cuny].[CourseDescription]
(
 [CourseDescriptionId] int IDENTITY (1, 1) NOT NULL ,
 [CourseDescription]   nvarchar(40) NOT NULL ,
 [ClassTime]           char(5) NOT NULL CONSTRAINT [CourseDescription_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]            varchar(30) NOT NULL CONSTRAINT [CourseDescription_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]           varchar(30) NOT NULL CONSTRAINT [CourseDescription_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [CourseDescription_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]           datetime2(7) NOT NULL CONSTRAINT [CourseDescription_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]   datetime2(7) NOT NULL CONSTRAINT [CourseDescription_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId] int NOT NULL CONSTRAINT [CourseDescription_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_CourseDescription] PRIMARY KEY CLUSTERED ([CourseDescriptionId] ASC)
);
GO








-- ************************************** [Cuny].[Building]

CREATE TABLE [Cuny].[Building]
(
 [BuildingId]           int IDENTITY (1, 1) NOT NULL ,
 [BuildingAbbreviation] nvarchar(10) NOT NULL ,
 [ClassTime]            char(5) NOT NULL CONSTRAINT [Building_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]             varchar(30) NOT NULL CONSTRAINT [Building_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]            varchar(30) NOT NULL CONSTRAINT [Building_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [Building_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]            datetime2(7) NOT NULL CONSTRAINT [Building_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]    datetime2(7) NOT NULL CONSTRAINT [Building_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId]  int NOT NULL CONSTRAINT [Building_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED ([BuildingId] ASC)
);
GO








-- ************************************** [Process].[WorkflowSteps]

CREATE TABLE [Process].[WorkflowSteps]
(
 [WorkFlowStepKey]           int IDENTITY (1, 1) NOT NULL ,
 [WorkFlowStepDescription]   nvarchar(100) NOT NULL ,
 [WorkFlowStepTableRowCount] int NOT NULL CONSTRAINT [DF_WorkFlowSteps_WorkFlowStepTableRowCount] DEFAULT (0) ,
 [LastName]                  varchar(30) NOT NULL CONSTRAINT [DF_WorkFlowSteps_LastName] DEFAULT 'Prashar' ,
 [FirstName]                 varchar(30) NOT NULL CONSTRAINT [DF_WorkFlowSteps_FirstName] DEFAULT 'Mudit' ,
 [StartingDateTime]          datetime2(7) NOT NULL CONSTRAINT [DF_WorkFlowSteps_StartingDateTime] DEFAULT sysdatetime() ,
 [EndingDateTime]            datetime2(7) NOT NULL CONSTRAINT [DF_WorkFlowSteps_EndingDateTime] DEFAULT sysdatetime() ,
 [ClassTime]                 char(5) NOT NULL CONSTRAINT [DF_WorkFlowSteps_ClassTime] DEFAULT '7:45' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [DF_WorkFlowSteps_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [AuthorizationUserId]       int NOT NULL ,


 CONSTRAINT [PK_WorkFlowSteps] PRIMARY KEY CLUSTERED ([WorkFlowStepKey] ASC),
 CONSTRAINT [FK_229] FOREIGN KEY ([AuthorizationUserId])  REFERENCES [DbSecurity].[UserAuthorization]([AuthorizationUserId])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_229] ON [Process].[WorkflowSteps] 
 (
  [AuthorizationUserId] ASC
 )

GO







-- ************************************** [Cuny].[Room]

CREATE TABLE [Cuny].[Room]
(
 [RoomId]              int IDENTITY (1, 1) NOT NULL ,
 [BuildingId]          int NOT NULL ,
 [RoomCode]            varchar(30) NOT NULL ,
 [ClassTime]           char(5) NOT NULL CONSTRAINT [Room_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]            varchar(30) NOT NULL CONSTRAINT [Room_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]           varchar(30) NOT NULL CONSTRAINT [Room_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [Room_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]           datetime2(7) NOT NULL CONSTRAINT [Room_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]   datetime2(7) NOT NULL CONSTRAINT [Room_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId] int NOT NULL CONSTRAINT [Room_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED ([RoomId] ASC),
 CONSTRAINT [FK_44] FOREIGN KEY ([BuildingId])  REFERENCES [Cuny].[Building]([BuildingId])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_44] ON [Cuny].[Room] 
 (
  [BuildingId] ASC
 )

GO







-- ************************************** [Cuny].[Course]

CREATE TABLE [Cuny].[Course]
(
 [CourseId]            int IDENTITY (1, 1) NOT NULL ,
 [CourseDescriptionId] int NOT NULL ,
 [DepartmentId]        int NOT NULL ,
 [CourseLevel]         varchar(30) NOT NULL ,
 [CourseHours]         int NOT NULL ,
 [CourseCredit]        int NOT NULL ,
 [ClassTime]           char(5) NOT NULL CONSTRAINT [Course_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]            varchar(30) NOT NULL CONSTRAINT [Course_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]           varchar(30) NOT NULL CONSTRAINT [Course_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]   varchar(55) NOT NULL CONSTRAINT [Course_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]           datetime2(7) NOT NULL CONSTRAINT [Course_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]   datetime2(7) NOT NULL CONSTRAINT [Course_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId] int NOT NULL CONSTRAINT [Course_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([CourseId] ASC),
 CONSTRAINT [FK_64] FOREIGN KEY ([CourseDescriptionId])  REFERENCES [Cuny].[CourseDescription]([CourseDescriptionId]),
 CONSTRAINT [FK_67] FOREIGN KEY ([DepartmentId])  REFERENCES [Cuny].[Department]([DepartmentId])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_64] ON [Cuny].[Course] 
 (
  [CourseDescriptionId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_67] ON [Cuny].[Course] 
 (
  [DepartmentId] ASC
 )

GO







-- ************************************** [Cuny].[Class]

CREATE TABLE [Cuny].[Class]
(
 [ClassId]              int IDENTITY (1, 1) NOT NULL ,
 [CourseId]             int NOT NULL ,
 [SemesterId]           int NOT NULL ,
 [InstructorId]         int NOT NULL ,
 [InstructionModeId]    int NOT NULL ,
 [RoomId]               int NOT NULL ,
 [ClassSection]         nvarchar(20) NOT NULL ,
 [ClassCode]            int NOT NULL ,
 [ClassScheduledDay]    nvarchar(10) NOT NULL ,
 [ClassStartTime]       nvarchar(20) NOT NULL ,
 [ClassEndTime]         nvarchar(20) NOT NULL ,
 [TotalEnrollment]      int NOT NULL ,
 [TotalEnrollmentLimit] int NOT NULL ,
 [ClassTime]            char(5) NOT NULL CONSTRAINT [Class_UserAuthorization_ClassTime] DEFAULT '7:45' ,
 [LastName]             varchar(30) NOT NULL CONSTRAINT [Class_UserAuthorization_LastName] DEFAULT 'Prashar' ,
 [FirstName]            varchar(30) NOT NULL CONSTRAINT [Class_UserAuthorization_FirstName] DEFAULT 'Mudit' ,
 [QmailEmailAddress]    varchar(55) NOT NULL CONSTRAINT [Class_UserAuthorization_QmailEmailAddress] DEFAULT 'mudit.prashar69@qmail.cuny.edu' ,
 [DateAdded]            datetime2(7) NOT NULL CONSTRAINT [Class_UserAuthorization_DateAdded] DEFAULT sysdatetime() ,
 [DateOfLastUpdated]    datetime2(7) NOT NULL CONSTRAINT [Class_UserAuthorization_DateOfLastUpdated] DEFAULT sysdatetime() ,
 [AuthorizationUserId]  int NOT NULL CONSTRAINT [Class_UserAuthorization_AuthorizationUserId] DEFAULT 69 ,


 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ([ClassId] ASC),
 CONSTRAINT [FK_76] FOREIGN KEY ([CourseId])  REFERENCES [Cuny].[Course]([CourseId]),
 CONSTRAINT [FK_79] FOREIGN KEY ([SemesterId])  REFERENCES [Cuny].[Semester]([SemesterId]),
 CONSTRAINT [FK_82] FOREIGN KEY ([InstructorId])  REFERENCES [Cuny].[Instructor]([InstructorId]),
 CONSTRAINT [FK_92] FOREIGN KEY ([InstructionModeId])  REFERENCES [Cuny].[InstructionMode]([InstructionModeId]),
 CONSTRAINT [FK_95] FOREIGN KEY ([RoomId])  REFERENCES [Cuny].[Room]([RoomId])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_76] ON [Cuny].[Class] 
 (
  [CourseId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_79] ON [Cuny].[Class] 
 (
  [SemesterId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_82] ON [Cuny].[Class] 
 (
  [InstructorId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_92] ON [Cuny].[Class] 
 (
  [InstructionModeId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_95] ON [Cuny].[Class] 
 (
  [RoomId] ASC
 )

GO







