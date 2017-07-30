SELECT CUST_VENDOR_DIM.NAME,DATE_DIM.CALYEAR,DATE_DIM.CALQUARTER,SUM(ExtCost),COUNT(Inventory_Fact.INVENTORYKEY)
FROM Inventory_Fact 
    JOIN CUST_VENDOR_DIM ON INVENTORY_FACT.CUSTVENDORKEY = CUST_VENDOR_DIM.CUSTVENDORKEY
    JOIN DATE_DIM ON INVENTORY_FACT.DateKey = Date_Dim.DateKey
WHERE INVENTORY_FACT.TRANSTYPEKEY = 5
    AND (DATE_DIM.CalYear = 2011 OR DATE_DIM.CALYEAR = 2012)
GROUP BY CUST_VENDOR_DIM.NAME, ROLLUP(DATE_DIM.CALYEAR,DATE_DIM.CALQUARTER);