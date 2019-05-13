select * from Common.UPCHierarchyView where UPCName like '%Frito-Lay%';

select a.UPCMasterId,a.UPCName,a.ASIN,a.ASIN_Name,a.GTINNumber,a.GTINName,b.ASIN,b.ASINMasterId,b.ASIN_Name,b.UPCMasterId,b.UPCName
from Common.UPCHierarchyView as a
right outer join Common.ASINHierarchyView as b
on a.UPCMasterId=b.UPCMasterId
where --a.UPCName like '%Frito%'
b.ASINMasterId is not NULL
and a.UPCMasterId is not NULL
order by a.UPCMasterId;

