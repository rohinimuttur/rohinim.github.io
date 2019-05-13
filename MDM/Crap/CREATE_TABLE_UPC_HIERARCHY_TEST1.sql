USE MDM
GO

CREATE TABLE dbo.TEST1_MDM_UPC_HIERARCHY
(    
       [UPCMasterId] int NOT NULL PRIMARY KEY CLUSTERED   
	 , [UPC] nvarchar(50) NULL 
	 , [GTINNumber] varchar(50) NULL
	 , [UPCName] nvarchar(255)  NULL     
	  ,[GTINName] varchar(255) NULL
      ,[SAPHierId] int NULL
      ,[DefaultHierId] int NULL
      ,[BU] varchar(50) NULL
      ,[PepsiBrand] varchar(50) NULL
      ,[SubBU] varchar(50) NULL
      ,[BrandSource] varchar(50) NULL
      ,[IsPepsiProduct] bit NOT NULL
      ,[IsPepsiProductOld] bit NOT NULL    
     , [StartDate] datetime2 (2) GENERATED ALWAYS AS ROW START  
     , [EndDate] datetime2 (2) GENERATED ALWAYS AS ROW END  
      , PERIOD FOR SYSTEM_TIME (StartDate, EndDate)  
 )    
 WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE =dbo.TEST1_HIST_UPC_HIERARCHY));
 
