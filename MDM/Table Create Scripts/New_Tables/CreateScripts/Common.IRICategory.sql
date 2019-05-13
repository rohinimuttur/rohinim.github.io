USE [TDWH]
GO

/****** Object:  Table [Common].[IRICategory]    Script Date: 4/11/2019 1:27:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Common].[IRICategory](
	[IRICategoryId] [int] IDENTITY(1,1) NOT NULL,
	[IRIUPC] [nvarchar](50) NULL,
	[UPCName] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[SubCategory] [nvarchar](255) NULL,
	[ParentCompany] [nvarchar](255) NULL,
	[Manufacturer] [nvarchar](255) NULL,
	[IRIUPC_SixDigit] [nvarchar](50) NULL,
	[IRIUPC_EightDigit] [nvarchar](50) NULL,
	[IRIUPC_NineDigit] [nvarchar](50) NULL,
	[IRIUPC_TenDigit] [nvarchar](50) NULL,
	[IRIUPC_TenDigitV2] [nvarchar](50) NULL,
	[IRIUPC_ElevenDigit] [nvarchar](50) NULL,
	[IRIUPC_ElevenDigitV2] [nvarchar](50) NULL,
	[LastUpdatedUserId] [varchar](255) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LineageID] [int] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
	[IsPepsiCategory] [int] NULL,
	[BU] [varchar](50) NULL,
	[LineExtension] [varchar](255) NULL,
	[TradeMark] [varchar](255) NULL,
	[CustomUSFLNASaltySnacksSize] [varchar](50) NULL,
	[CustomUSCount] [varchar](50) NULL,
	[CustomUSSizePerUnitOz] [varchar](50) NULL,
	[IRIUPC_SrcEightDigit] [nvarchar](50) NULL,
	[IRIUPC_SrcNineDigit] [nvarchar](50) NULL,
	[IRIUPC_SrcTenDigit] [nvarchar](50) NULL,
	[ItemLaunchWeek] [varchar](100) NULL,
	[ItemLaunchYear] [varchar](100) NULL,
	[BrandLaunchWeek] [varchar](100) NULL,
	[BrandLaunchYear] [varchar](100) NULL,
	[CustomUSPackage] [varchar](100) NULL,
	[IRICategoryHead] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IRICategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Common].[IRICategory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [Common].[IRICategory] ADD  DEFAULT (getutcdate()) FOR [Modified]
GO

ALTER TABLE [Common].[IRICategory] ADD  DEFAULT (getutcdate()) FOR [Created]
GO

