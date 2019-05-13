USE [MDM]
GO


CREATE TABLE [dbo].[TEST1_MDM_PepsiHierarchy]
(
    [PepsiHierarchyId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UPC] [nvarchar](50) NULL,
	[BU] [varchar](50) NULL,
	[PepsiBrand] [varchar](50) NULL,
	[SubBU] [varchar](50) NULL,
	[BrandSource] [varchar](50) NULL,
	[IsPepsiProduct] [bit] NOT NULL,
	[IsPepsiProductOld] [bit] NULL,
    [StartDate] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[EndDate] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (StartDate, EndDate) 
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TEST1_HIST_PepsiHierarchy));