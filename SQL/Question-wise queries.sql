
 -- 1 Query to display total sales made by the adventure work.
select Round(sum(SalesAmount),2)  as Total_sales
from factsales;

-- 2 Query to display total production cost
select round(sum(TotalProductCost),2) as Total_ProductionCost
from factsales;

-- 3 Query to display total profit
select round(sum(Profit),2) as Total_Profit
from factsales;

-- 4 Query to display no of customer
select count(CustomerKey) as no_of_customers
from dimcustomer;

-- 5 Query to display no of product
select distinct(count(productKey)) as no_of_product
from dimproduct;

-- 6 Query to display year wise sales
SELECT year AS year, round(sum(s.SalesAmount),2) AS sales
FROM factsales s 
RIGHT JOIN dimorderdate o 
ON s.OrderDateKey = o.OrderDateKey
GROUP BY year;


-- 7 Query to display month wise sales
SELECT d.MonthFullName, round(SUM(f.SalesAmount),2) AS Sales 
FROM factsales f 
inner JOIN dimorderdate d ON d.OrderDateKey = f.OrderDateKey
GROUP BY d.MonthFullName
order by d.MonthFullName asc;

-- 8 Query to display quarter wise sales
select quarter, Round(sum(SalesAmount),2) as Total_sales
from dimorderdate d left join sales s on d.OrderDateKey = s.OrderDateKey
group by Quarter;

-- 9 Query to display region wise gross profit
select round(sum(SalesAmount-TaxAmt-Freight-TotalProductCost),2) as profit
from factsales;

-- 10 Query to display year wise month wise sales
select d.year,d.MonthFullName, round(SUM(f.SalesAmount),2) AS Sales 
from factsales f 
inner JOIN dimorderdate d ON d.OrderDateKey = f.OrderDateKey
group by d.MonthFullName,d.year
order by d.MonthFullName asc;

-- 11 Query to display country wise gross profit
select region,round(sum(SalesAmount-TotalProductCost),2) as profit
from factsales
group by region
order by profit desc;

-- 12 Query to display region wise percentage sales
SELECT region, concat(round((sum(SalesAmount) * 100.0 / total_sales)),'%') AS Sales_percentage
FROM factsales,(select sum(SalesAmount) AS total_sales FROM factsales) AS total
GROUP BY region, total_sales;

-- 13 Query to display month wise sales vs production cost
select o.MonthFullName, round(sum(s.SalesAmount),1) as Sales ,round(sum(s.TotalProductCost),1) as productioncost
from dimorderdate o left join sales s on o.OrderDateKey = s.OrderDateKey
group by o.MonthFullName;