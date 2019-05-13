USE [TDWH]
GO

/****** Object:  Table [Common].[UPCMaster_tst]    Script Date: 4/4/2019 2:10:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Common].[UPCMaster_tst](
	[UPCMasterId] [int] NOT NULL,
	[UPC] [nvarchar](50) NULL,
	[UPCName] [nvarchar](255) NULL,
	[IRICategoryId] [int] NULL,
	[SAPHierId] [int] NULL,
	[DefaultHierId] [int] NULL,
	[BU] [nvarchar](50) NULL,
	[PepsiBrand] [nvarchar](50) NULL,
	[SubBU] [nvarchar](50) NULL,
	[IsPepsiProduct] [bit] NOT NULL,
	[LastUpdatedUserId] [varchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LineageID] [int] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Source] [varchar](20) NULL,
	[PlanningBrandSAPId] [nvarchar](50) NULL,
	[PlanningBrandName] [nvarchar](50) NULL,
	[BrandSizePackSAPId] [nvarchar](50) NULL,
	[BrandSizePackName] [nvarchar](50) NULL,
	[SAPMaterialId] [nvarchar](50) NULL,
	[SAPMaterialName] [nvarchar](255) NULL,
	[Size] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[SubCategory] [nvarchar](50) NULL,
	[SAPSegmentName] [varchar](30) NULL,
	[ParentCompanyName] [varchar](200) NULL,
	[IsUPCNew] [bit] NULL,
	[IsSaturatedFatCompliant] [bit] NULL,
	[IsSodiumCompliant] [bit] NULL,
	[KCal)] [float] NULL,
	[SaturatedFatInGrams] [float] NULL,
	[SodiumInMg] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[UPCMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

