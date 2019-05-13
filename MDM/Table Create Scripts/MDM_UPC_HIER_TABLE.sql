USE [MDM]
GO

/****** Object:  Table [dbo].[TEST1_MDM_UPC_HIERARCHY]    Script Date: 4/10/2019 9:50:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TEST1_MDM_UPC_HIERARCHY](
	[UPCMasterId] [int] NOT NULL,
	[UPC] [nvarchar](50) NULL,
	[GTINNumber] [varchar](50) NULL,
	[UPCName] [nvarchar](255) NULL,
	[GTINName] [varchar](255) NULL,
	[SAPHierId] [int] NULL,
	[DefaultHierId] [int] NULL,
	[BU] [varchar](50) NULL,
	[PepsiBrand] [varchar](50) NULL,
	[SubBU] [varchar](50) NULL,
	[BrandSource] [varchar](50) NULL,
	[IsPepsiProduct] [bit] NOT NULL,
	[IsPepsiProductOld] [bit] NOT NULL,
	[StartDate] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[EndDate] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UPCMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([StartDate], [EndDate])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[TEST1_HIST_UPC_HIERARCHY] )
)
GO

