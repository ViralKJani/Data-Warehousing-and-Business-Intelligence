SELECT TRANS_TYPE_DIM.TRANSDESCRIPTION,COMPANYNAME,BPNAME,SUM(ExtCost),COUNT(Inventory_Fact.INVENTORYKEY)
FROM Inventory_Fact 
    JOIN BRANCH_PLANT_DIM ON INVENTORY_FACT.BRANCHPLANTKEY = BRANCH_PLANT_DIM.BRANCHPLANTKEY
    JOIN COMPANY_DIM ON BRANCH_PLANT_DIM.COMPANYKEY = COMPANY_DIM.COMPANYKEY
    JOIN TRANS_TYPE_DIM ON Inventory_Fact.TRANSTYPEKEY = TRANS_TYPE_DIM.TRANSTYPEKEY
GROUP BY GROUPING SETS( (TRANS_TYPE_DIM.TRANSDESCRIPTION,COMPANYNAME,BPNAME), 
                        (TRANS_TYPE_DIM.TRANSDESCRIPTION,COMPANYNAME), 
                        TRANS_TYPE_DIM.TRANSDESCRIPTION, 
                        () );