USE [MDM]
GO


CREATE TABLE [dbo].[TEST1_MDM_AmazonHierarchy]
(
    [AmazonHierarchyId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Category] [varchar](50) NULL,
	[Category_Name] [varchar](50) NULL,
	[Brand_Name] [varchar](50) NULL,
	[Manufacturer_Id] [varchar](50) NULL,
	[Manufacturer_Name] [varchar](50) NULL,
	[ASIN] [varchar](50) NULL,
	[Product_Description] [varchar](255) NULL,
	[LastUpdatedUserId] [varchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LineageID] [int] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
    [StartDate] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[EndDate] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (StartDate, EndDate) 
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TEST1_HIST_AmazonHierarchy));