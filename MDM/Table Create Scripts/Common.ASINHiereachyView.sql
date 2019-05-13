USE [TDWH]
GO

/****** Object:  View [Common].[ASINHierarchyView]    Script Date: 4/10/2019 10:14:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE       VIEW [Common].[ASINHierarchyView] as (

SELECT c.ASIN
      ,c.Product_Description ASIN_Name  
      ,c.ASINMasterId
      , a.UPCMasterId
      ,a.UPC
	   , sap.GTINName
	   , sap.GTINNumber
      --,a.UPCName
	   , Case  When a.UPCMasterId  < 0 THEN a.UPCName 
      ELSE 
      ISNULL(replace(GTINName,'',NULL)  ,  a.UPCName)END  UPCName
      ,a.SAPHierId
      ,a.DefaultHierId
      ,isnull(brd.BU, ubrd.BU) BU
      ,isnull(brd.PepsiBrand, ubrd.PepsiBrand) PepsiBrand
      ,isnull(brd.SubBU, ubrd.SubBU) SubBU
	   ,isnull(brd.Source, ubrd.Source) BrandSource
      , Case c.IsShareProduct When 0 then 1 Else 0 End IsPepsiProduct
      ,b.IRIUPC
      ,b.UPCName IRI_UPCName
      ,b.Category IRI_Category
      ,b.SubCategory IRI_SubCategory
      ,NULL CategoryName
      ,NULL ProductGroup 
      ,Cat.Category AMZ_IRI_Category
      ,Cat.SubCategory AMZ_IRI_SubCategory
      ,c.AmazonCategoryId
      ,isnull(a.PlanningBrandName, a.PepsiBrand ) PlanningBrandName 
      , a.PlanningBrandSAPId 
      ,a.Category  
     ,  a.SAPSegmentName
     ,isnull(c.ParentCompanyName, a.ParentCompanyName) ParentCompany
     ,c.Segment
     ,c.OCR_BrandName
     ,ISNULL(a.SubCategory, 'Other') ECom_Category
     , b.LineExtension 
      , b.TradeMark 
      ,b.Manufacturer 
      , Qcat.CustomCategory 
      ,QCat.CustomProductGroup 
      ,Qcat.InnovationClass 
      ,Qcat.InnovationSubClass
      ,a.GTINMasterId
	  , brd.Source Brd_Source 
	  , c.PepsiBrand NewBrand
	  , ecmsb.Unit_Size
	  , ecmsb.Pack_Size
	  , ecmsb.BFY
	  ,ecmsb.VP
	  ,'https://amazon.com/dp/' + c.ASIN Link,
	  c.Created,
	  c.Format,
	  fbrd.FiananceSubBU , 
       fbrd.FinanceBrand ,
	    fbrd.FinanceSubBrand,
		  [MDM_GTINNumber],
       [MDM_GTINName],
	   c.ExcludeFlag,
	  isnull( c.Harmonized_SubCategory, a.Harmonized_SubCategory) Harmonized_SubCategory,
	  isnull(c.Level2_Harmonized_SubCategory, a.Level2_Harmonized_SubCategory) Level2_Harmonized_SubCategory,
	  isnull(c.Level1_Harmonized_SubCategory, a.Level1_Harmonized_SubCategory) Level1_Harmonized_SubCategory,
	  c.BrandMAsterId 
  FROM  Common.ASINMaster c
  --INNER JOIN Common.PepProdHierarchy p
  --ON c.PepProdHierarchyId= p.PepProdHierarchyId
  --AND p.IsDeleted = 0
  FULL OUTER JOIN [Common].[UPCMaster] a WITH (NOLOCK) 
  ON c.UPCMasterId = a.UPCMasterId 
  AND a.IsDeleted = 0
  left outer join common.brandmaster ubrd
  on ubrd.BrandMAsterId = a.BrandMAsterId 
  LEFT OUTER JOIN [Common].[IRICategory] b  WITH (NOLOCK)
  ON a.IRICategoryId = b.IRICategoryId
  LEFT OUTER JOIN Common.OCRIRICategory Cat
  ON Cat.OCRIRICategoryId = c.OCRIRICategoryId
  LEFT OUTER JOIN [DataStage].[STG_Quaker_CustomCategoryView] QCat
  ON c.ASIN = QCat.ASIN 
     left outer join common.brandmaster brd
  on brd.BrandMAsterId = c.BrandMAsterId 
   left outer join [Common].[FinanceBrandMaster] fbrd
  on fbrd.FinanceBrandMasterId = c.FinanceBrandMasterId 
  left outer join [Common].[SAPGTINMaster] sap
  ON sap.GTINMasterId = a.GTINMasterId    
  left outer join [DataStage].[STG_ASIN_AttributesFromECMSB] ecmsb 
  on  ecmsb.asin = c.asin ) 








GO

