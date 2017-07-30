select Name, CalYear, CalQuarter, sum(ExtCost) as tot_cost, count(*) as Cnt
from inventory_fact i, cust_vendor_dim c, date_dim d
where TransTypeKey = 5 and
      d.Calyear BETWEEN 2011 AND 2012 AND 
      d.datekey = i.datekey and
      i.CustVendorKey = c.CustVendorKey AND
      i.DateKey = d.DateKey
group by CUBE(c.Name, (CalYear, d.CalQuarter));
