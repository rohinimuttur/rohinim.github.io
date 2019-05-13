USE [MDM]
GO

CREATE TABLE [dbo].[TEST2_MDM_UPC](	
	[UPCMasterId] [int] NOT NULL PRIMARY KEY,
	[UPC] [nvarchar](50) NULL,
	[UPCName] [nvarchar](255) NULL,	
	[BrandCategory] [nvarchar](50) NULL,	
	[Proc_UPCName] [nvarchar](4000) NULL,
	[Proc_UPCName1] [varchar](255) NULL,
	[Proc_UPCName2] [varchar](255) NULL,
	[IsUPCFuzzy] int NOT NULL,
	[IsUPCFuzzyOld] int NOT NULL,
	[IsUPCFuzzyNew] int NOT NULL,
	[IsUPCNew] bit NULL,	
	[LastUpdatedUserId] [varchar](256) NULL,
	[Created] datetime NULL,	
	[StartDate] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[EndDate] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (StartDate, EndDate) 

) 
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TEST2_HIST_UPC));




CREATE TABLE MDM_UPC(	
	[UPCMasterId] [int] NOT NULL PRIMARY KEY,
	[UPC] [nvarchar](50) NULL,
	[UPCName] [nvarchar](255) NULL,	
	[BrandCategory] [nvarchar](50) NULL,	
	[Proc_UPCName] [nvarchar](4000) NULL,
	[Proc_UPCName1] [varchar](255) NULL,
	[Proc_UPCName2] [varchar](255) NULL,
	[IsUPCFuzzy] int NOT NULL,
	[IsUPCFuzzyOld] int NOT NULL,
	[IsUPCFuzzyNew] int NOT NULL,
	[IsUPCNew] bit NULL,	
	[LastUpdatedUserId] [varchar](256) NULL,
	[Created] datetime NULL,	
	[StartDate] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[EndDate] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (StartDate, EndDate) 

) 
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = HIST_UPC));