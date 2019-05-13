USE [MDM]
GO


CREATE TABLE [dbo].[TEST1_MDM_IRICategory]
(
    [IRICategoryId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
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
    [StartDate] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[EndDate] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (StartDate, EndDate) 
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TEST1_HIST_IRICategory));