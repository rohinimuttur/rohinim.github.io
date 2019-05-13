CREATE TABLE TEST_MDM_UPC_HIERARCHY
(    
       [UPCMasterId] int NOT NULL PRIMARY KEY CLUSTERED   
	 , [UPC] nvarchar(50) NULL 
	 , [GTINNumber] varchar(50) NULL
	 , [UPCName] nvarchar(255)  NULL     
	  ,[GTINName] varchar(255) NULL
      ,[SAPHierId] int NULL
      ,[DefaultHierId] int NULL
      ,[BU]
      ,[PepsiBrand]
      ,[SubBU]
      ,[BrandSource]
      ,[IsPepsiProduct] bit NOT NULL
      ,[IsPepsiProductOld]
      ,[IRIUPC]
      ,[IRI_UPCName]
      ,[IRI_Category]
      ,[IRI_SubCategory]
      ,[OLD_IRI_Category]
      ,[OLD_IRI_SubCategory]
     --> ,[ASIN]
     --> ,[ASIN_Name]
      -->,[PlanningBrandName]
      ,[PlanningBrandSAPId]
      ,[BrandCategory] nvarchar(50) NULL 
      ,[SAPSegmentName] varchar(30) NULL 
      ,[ParentCompany]
      ,[ParentCompanyName] varchar(200) NULL 
      ,[ParentCompanyOld]
      ,[Proc_UPCName] nvarchar(255)  NULL--> Confirm
      ,[Proc_UPCName1] nvarchar(255)  NULL
      ,[Proc_UPCName2] nvarchar(255)  NULL
      ,[IsUPCFuzzy] bit NOT NULL
      ,[IsUPCFuzzyOld] bit  NULL
      ,[IsUPCFuzzyNew] bit  NULL
      ,[ECom_Category]
      ,[LineExtension]
      ,[TradeMark]
      ,[Manufacturer] varchar(255) NULL
      ,[IsUPCNew] bit NULL
      ,[Source] varchar(20) NULL
      ,[IsSaturatedFatCompliant] bit NULL
      ,[IsSodiumCompliant] bit NULL
      ,[KCal] float NULL
      ,[SaturatedFatInGrams] float NULL
      ,[SodiumInMg] float NULL
      ,[CustomCategory]
      ,[CustomProductGroup]
      ,[InnovationClass]
      ,[InnovationSubClass]
      ,[GTINMasterId] int NULL
      ,[IRICategoryId] int NULL
      ,[CustomUSFLNASaltySnacksSize]
      ,[CustomUSCount]
      ,[CustomUSSizePerUnitOz]
      ,[IsMdmFuzzy] bit NULL
      ,[IsSapFuzzy] bit NULL
      ,[CLASS_NM]
      ,[SIZE_DSC]
      ,[WMT_ItemID]
      ,[COPA_PLNG_BRND_VAL]
      ,[COPA_PLNG_BRND_NM]
      ,[LastUpdatedUserId]
      ,[Brd_Source]
      ,[MDM_GTINNumber]
      ,[MDM_GTINName]
      ,[Created]
      ,[NAN_Category]
      ,[FiananceSubBU]
      ,[FinanceBrand]
      ,[FinanceSubBrand]
      ,[ExcludeFlag]
      ,[BrandMasterId]
      ,[Hrzn_Pkg_Grp_Desc]
      ,[Config_Qty]
      ,[Harmonized_SubCategory]
      ,[Level2_Harmonized_SubCategory]
      ,[Level1_Harmonized_SubCategory]
     , [StartDate] datetime2 (2) GENERATED ALWAYS AS ROW START  
     , [EndDate] datetime2 (2) GENERATED ALWAYS AS ROW END  
      , PERIOD FOR SYSTEM_TIME (StartDate, EndDate)  
 )    
 WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = HIST_UPC_HIERARCHY));
 
