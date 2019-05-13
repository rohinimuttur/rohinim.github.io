USE [TDWH]
GO

/****** Object:  View [Common].[UPCHierarchyView]    Script Date: 4/4/2019 3:08:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














CREATE       VIEW [Common].[UPCHierarchyView]  AS
(
SELECT   a.UPCMasterId
      ,a.UPC
	  ,sap.GTINNumber
      , Case  When a.UPCMasterId  < 0 THEN a.UPCName 
      ELSE 
      ISNULL(replace(GTINName,'',NULL)  ,  a.UPCName)END  UPCName
       , sap.GTINName
      ,a.SAPHierId
      ,a.DefaultHierId
      ,brd.BU
      ,brd.PepsiBrand
      ,brd.SubBU
	  ,brd.Source BrandSource
      ,a.IsPepsiProduct
	  ,bak.IsPepsiProduct IsPepsiProductOld
      ,b.IRIUPC
      ,b.UPCName IRI_UPCName
      ,b.Category IRI_Category
      ,b.SubCategory IRI_SubCategory
	  ,bi.Category OLD_IRI_Category
      ,bi.SubCategory OLD_IRI_SubCategory
      ,NULL ASIN
      ,NULL ASIN_Name
       ,isnull(a.PlanningBrandName , a.PepsiBrand )  PlanningBrandName
      , a.PlanningBrandSAPId 
      ,a.Category BrandCategory
      ,a.SAPSegmentName
      ,b.ParentCompany
	  ,a.ParentCompanyName
      ,bi.ParentCompany ParentCompanyOld
	  ,Case When a.IRIcategoryID=-1   Then ISNULL(replace(GTINName,'',NULL)  ,  a.UPCName) else
	  Case When a.LastUpdatedUserId  like '%fuzzy%' Then ISNULL(replace(GTINName,'',NULL)  ,  a.UPCName) else 
		Case When a.LastUpdatedUserId  like '%admin%' Then ISNULL(replace(GTINName,'',NULL)  ,  a.UPCName) else b.UPCName  end end
      
       end Proc_UPCName

	   , Isnull(a.MDM_GTINName , a.UPCName) Proc_UPCName1
	    , Isnull(a.MDM_ProductDescription , a.UPCName) Proc_UPCName2
	  ,Case When a.LastUpdatedUserId  like '%fuzzy%' Then 1 else 
		Case When a.LastUpdatedUserId  like '%admin%' Then 1 else 0 end
      
       end IsUPCFuzzy,
	   Case When  bak.LastUpdatedUserId  like '%fuzzy%' Then 1 else 
		Case When  bak.LastUpdatedUserId  like '%admin%' Then 1 else 0 end
      
       end IsUPCFuzzyOld,

       	Case When a.LastUpdatedUserId  like '%admin%' Then 0 else 1 end
      
       IsUPCFuzzyNew ,
        ISNULL(a.SubCategory, 'Other') ECom_Category,
       b.LineExtension ,
       b.TradeMark ,
      -- b.Manufacturer ,
	  isnull(a.IRI_Manufacturer,  b.Manufacturer ) Manufacturer,
       a.IsUPCNew,
       a.Source ,
       a.IsSaturatedFatCompliant,
       a.IsSodiumCompliant,
       a.KCal,
       a.SaturatedFatInGrams,
       a.SodiumInMg,
       Qcat.CustomCategory ,
       QCat.CustomProductGroup ,
       Qcat.InnovationClass ,
       Qcat.InnovationSubClass,
       a.GTINMasterId,
       a.IRICategoryId,
       
       b.CustomUSFLNASaltySnacksSize ,
       b.CustomUSCount,
       b.CustomUSSizePerUnitOz,
	   sap.IsMdmFuzzy,
	   sap.IsSapFuzzy,
	   a.CLASS_NM ,
	   a.SIZE_DSC,
	   a.WMT_ItemID,
	   [COPA_PLNG_BRND_VAL],
      [COPA_PLNG_BRND_NM],
	  a.LastUpdatedUserId,
	   brd.Source Brd_Source,
	    [MDM_GTINNumber],
       [MDM_GTINName],
	   a.Created ,
	   nan_Cat.CategoryName NAN_Category,
	     fbrd.FiananceSubBU , 
       fbrd.FinanceBrand ,
	    fbrd.FinanceSubBrand,
		a.ExcludeFlag,
		brd.BrandMasterId,
		[Hrzn_Pkg_Grp_Desc],
       [Config_Qty],
	   a.Harmonized_SubCategory,
	  a.Level2_Harmonized_SubCategory,
	  a.Level1_Harmonized_SubCategory
  FROM  [Common].[UPCMaster] a WITH (NOLOCK)
  left join  [Common].[IRICategory] b  WITH (NOLOCK)
       on  a.IRICategoryId = b.IRICategoryId
  left outer join [DataStage].[STG_Quaker_CustomCategoryUPCView]  QCat
  ON a.UPC = QCat.UPC  
  left outer join [Common].[SAPGTINMaster] sap
  ON sap.GTINMasterId = a.GTINMasterId     
  AND sap.GTINMasterId > 0 
  left outer join [Common].upcmaster_bak_hist bak 
  on a.upcmasterid = bak.upcmasterid
  left outer join common.IriCategory_2017 bi
  on bi.iricategoryid = bak.IRICategoryId 
   left outer join common.brandmaster brd
  on brd.BrandMAsterId = a.BrandMAsterId
   left outer join [Common].[FinanceBrandMaster] fbrd
  on fbrd.FinanceBrandMasterId = a.FinanceBrandMasterId 

     left outer join common.CategoryMaster nan_cat
  on brd.CategoryMasterId = nan_cat.CategoryMasterId
   ) 













GO


