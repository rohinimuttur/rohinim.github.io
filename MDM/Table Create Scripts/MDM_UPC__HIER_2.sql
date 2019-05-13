USE [MDM]
GO

CREATE TABLE [dbo].[TEST1_MDM_PRODUCT_TABLE](
	[Id] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY CLUSTERED,
	[UPCMasterId] [int] NOT NULL,
	[UPC] [nvarchar](50) NULL,
	[UPCName] [nvarchar](255) NULL,
	[ASIN][varchar](50) NULL,
	[ASIN_Name] [varchar](255) NULL,
	[ASINMasterId] int NULL,
	[GTINNumber] [varchar](50) NULL,	
	[GTINName] [varchar](255) NULL,
	[SAPHierId] [int] NULL,
	[DefaultHierId] [int] NULL,
	[BU] [varchar](50) NULL,
	[PepsiBrand] [varchar](50) NULL,
	[SubBU] [varchar](50) NULL,
	[BrandSource] [varchar](50) NULL,
	[IsPepsiProduct] [bit] NOT NULL,
	[IsPepsiProductOld] [bit] NULL,
	[IRICategoryId] int NULL,
	[IRIUPC] [nvarchar](50) NULL,
	[IRI_UPCName] [nvarchar](255) NULL,
	[IRI_Category] [nvarchar](255) NULL,
	[IRI_SubCategory] [nvarchar](255) NULL,
	[CategoryName] [nvarchar](255) NULL,
	[ProductGroup] int NULL,
	[AMZ_IRI_Category] [nvarchar](50) NULL,
	[AMZ_IRI_SubCategory] [nvarchar](255) NULL,
	[AmazonCategoryId] int null,
	[PlanningBrandName] [nvarchar](50) NULL,
	[PlanningBrandSAPId] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[SAPSegmentName][varchar](30) NULL,
	[ParentCompany] [nvarchar](255) NULL,
	[ParentCompanyName] [varchar](200) NULL, -- In ASIn table this column is mapped to ParentCompany
	[ParentCompanyOld] [nvarchar](255) NULL,
	[Segment][varchar](50) NULL,
	[OCR_BrandName][varchar](200) NULL,
	[ECom_Category] [nvarchar](50) NOT NULL,
	[LineExtension] [varchar](255) NULL,
	[TradeMark] [varchar](255) NULL,
	[Manufacturer] [nvarchar](255) NULL,
	[CustomCategory] [varchar](100) NULL,
	[CustomProductGroup] [varchar](100) NULL,
	[InnovationClass] [varchar](50) NULL,
	[InnovationSubClass] [varchar](50) NULL,
	[GTINMasterId] int NULL,
	[Brd_Source] [varchar](50) NULL,
	[NewBrand] [varchar](50) NULL,
	[Unit_Size] [varchar](50) NULL,
	[Pack_Size] [varchar](50) NULL,
	[BFY] [varchar](20) NULL,
	[VP] [varchar](50) NULL,
	[Link] [varchar](72) NULL,
	[Created_ASIN] datetime NULL, -- Created separate Created attributes for ASIN and UPC
	[Format] [varchar](50) NULL,
	[FiananceSubBU] [varchar](50) NULL,
	[FinanceBrand] [varchar](50) NULL,
	[FinanceSubBrand] [varchar](50) NULL,
	[MDM_GTINNumber] [varchar](50) NULL,
	[MDM_GTINName] [varchar](255) NULL,
	[ExcludeFlag] bit NULL,
	[Harmonized_SubCategory] [varchar](255) NULL,
	[Level2_Harmonized_SubCategory] [varchar](255) NULL,
	[Level1_Harmonized_SubCategory] [varchar](255) NULL,
	[BrandMasterId] int NULL,	
	[OLD_IRI_Category] [nvarchar](255) NULL,
	[OLD_IRI_SubCategory] [nvarchar](255) NULL,
	[BrandCategory] [nvarchar](50) NULL,	
	[Proc_UPCName] [nvarchar](4000) NULL,
	[Proc_UPCName1] [varchar](255) NULL,
	[Proc_UPCName2] [varchar](255) NULL,
	[IsUPCFuzzy] int NOT NULL,
	[IsUPCFuzzyOld] int NOT NULL,
	[IsUPCFuzzyNew] int NOT NULL,
	[IsUPCNew] bit NULL,
	[Source] [varchar](20) NULL,
	[IsSaturatedFatCompliant] bit NULL,
	[IsSodiumCompliant] bit NULL,
	[KCal] float NULL,
	[SaturatedFatInGrams] float NULL,
	[SodiumInMg] float NULL,	
	[CustomUSFLNASaltySnacksSize] [varchar](50) NULL,
	[CustomUSCount] [varchar](50) NULL,
	[CustomUSSizePerUnitOz] [varchar](50) NULL,
	[IsMdmFuzzy] bit NULL,
	[IsSapFuzzy] bit NULL,
	[CLASS_NM] [varchar](100) NULL,
	[SIZE_DSC] [varchar](50) NULL,
	[WMT_ItemID] [varchar](50) NULL,
	[COPA_PLNG_BRND_VAL] [varchar](50) NULL,
	[COPA_PLNG_BRND_NM] [varchar](50) NULL,
	[LastUpdatedUserId] [varchar](256) NULL,
	[Created_UPC] datetime NULL,-- Separate Created for ASIN and UPC
	[NAN_Category] [varchar](50) NULL,
	[Hrzn_Pkg_Grp_Desc] [varchar](50) NULL,
	[Config_Qty] [varchar](50) NULL,
	[StartDate] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[EndDate] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME (StartDate, EndDate) 

) 
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.TEST1_HIST_PRODUCT_TABLE));