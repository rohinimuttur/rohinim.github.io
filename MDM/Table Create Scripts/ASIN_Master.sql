USE [TDWH]
GO

/****** Object:  Table [Common].[ASINMaster]    Script Date: 4/9/2019 2:39:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Common].[ASINMaster](
	[ASINMasterId] [int] IDENTITY(1,1) NOT NULL,
	[ASIN] [varchar](50) NULL,
	[Product_Description] [varchar](255) NULL,
	[AmazonHierarchyId] [int] NOT NULL,
	[PepProdHierarchyId] [int] NULL,
	[LastUpdatedUserId] [varchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LineageID] [int] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
	[HasDupDesc] [bit] NULL,
	[UPCMasterId] [int] NULL,
	[AmazonCategoryId] [int] NULL,
	[IsShareProduct] [bit] NULL,
	[Segment] [varchar](50) NULL,
	[ParentCompanyName] [varchar](200) NULL,
	[OCR_BrandName] [varchar](200) NULL,
	[InnovationClass] [varchar](255) NULL,
	[InnovationSubClass] [varchar](255) NULL,
	[OCRIRICategoryId] [int] NULL,
	[BU] [varchar](50) NULL,
	[PepsiBrand] [varchar](50) NULL,
	[SubBU] [varchar](50) NULL,
	[BrandMasterId] [int] NULL,
	[ExcludeFlag] [bit] NULL,
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
	[Format] [varchar](50) NULL,
	[FinanceBrandMasterId] [int] NULL,
	[Harmonized_SubCategory] [varchar](255) NULL,
	[Level2_Harmonized_SubCategory] [varchar](255) NULL,
	[Level1_Harmonized_SubCategory] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ASINMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Common].[ASINMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [Common].[ASINMaster] ADD  DEFAULT (getutcdate()) FOR [Modified]
GO

ALTER TABLE [Common].[ASINMaster] ADD  DEFAULT (getutcdate()) FOR [Created]
GO

ALTER TABLE [Common].[ASINMaster] ADD  DEFAULT ((0)) FOR [IsShareProduct]
GO

ALTER TABLE [Common].[ASINMaster] ADD  DEFAULT ((-1)) FOR [OCRIRICategoryId]
GO

ALTER TABLE [Common].[ASINMaster] ADD  DEFAULT ((-1)) FOR [BrandMasterId]
GO

ALTER TABLE [Common].[ASINMaster] ADD  DEFAULT ((0)) FOR [ExcludeFlag]
GO

ALTER TABLE [Common].[ASINMaster] ADD  DEFAULT ((-1)) FOR [FinanceBrandMasterId]
GO

ALTER TABLE [Common].[ASINMaster]  WITH CHECK ADD FOREIGN KEY([AmazonHierarchyId])
REFERENCES [Common].[AmazonHierarchy] ([AmazonHierarchyId])
GO

ALTER TABLE [Common].[ASINMaster]  WITH CHECK ADD FOREIGN KEY([OCRIRICategoryId])
REFERENCES [Common].[OCRIRICategory] ([OCRIRICategoryId])
GO

ALTER TABLE [Common].[ASINMaster]  WITH CHECK ADD FOREIGN KEY([PepProdHierarchyId])
REFERENCES [Common].[PepProdHierarchy] ([PepProdHierarchyId])
GO

