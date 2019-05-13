USE [TDWH]
GO

/****** Object:  Table [Common].[AmazonHierarchy]    Script Date: 4/11/2019 1:25:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Common].[AmazonHierarchy](
	[AmazonHierarchyId] [int] IDENTITY(1,1) NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[AmazonHierarchyId] ASC
)WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 85) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Common].[AmazonHierarchy] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [Common].[AmazonHierarchy] ADD  DEFAULT (getutcdate()) FOR [Modified]
GO

ALTER TABLE [Common].[AmazonHierarchy] ADD  DEFAULT (getutcdate()) FOR [Created]
GO

