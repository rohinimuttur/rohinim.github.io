USE [TDWH]
GO

/****** Object:  Table [Common].[BrandMaster]    Script Date: 4/9/2019 3:04:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Common].[BrandMaster](
	[BrandMasterId] [int] IDENTITY(1,1) NOT NULL,
	[BU] [varchar](50) NULL,
	[SubBU] [varchar](50) NULL,
	[PepsiBrand] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[LastUpdatedUserId] [varchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LineageID] [int] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CategoryMasterId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Common].[BrandMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [Common].[BrandMaster] ADD  DEFAULT (getutcdate()) FOR [Modified]
GO

ALTER TABLE [Common].[BrandMaster] ADD  DEFAULT (getutcdate()) FOR [Created]
GO

