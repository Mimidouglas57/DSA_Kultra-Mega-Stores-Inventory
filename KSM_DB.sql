CREATE DATABASE DSA_CAPSTONE_PROJECT_KMS_DB


SELECT * FROM KMS_Sql_Case_Study

---- PRODUT CATEGORY THAT HAD THE HIGHEST SALES
SELECT top 1 Product_Category, SUM(Sales) AS Total_Sales
FROM KMS_Sql_Case_Study
GROUP BY Product_Category
ORDER BY Total_Sales DESC



----- TOP 3 REGIONS IN TERMS OF SALES
SELECT top 3 Region, SUM(Sales) AS Total_Sales
FROM KMS_Sql_Case_Study
GROUP BY Region
ORDER BY Total_Sales DESC

SELECT TOP 3 * FROM KMS_Sql_Case_Study
	ORDER BY Sales DESc

----- BOTTOM 3 REGONS IN TERMS OF SALES
SELECT top 3 Region, SUM(Sales) AS Total_Sales
FROM KMS_Sql_Case_Study
GROUP BY Region
ORDER BY Total_Sales ASC

-----TOTAL SALES OF APPLIANCES IN ONTARIO

  SELECT SUM(Sales) AS Total_Appliance_Sales_Ontario
FROM KMS_Sql_Case_Study
WHERE Product_Sub_Category = 'Appliances'
  and Region = 'Ontario';

  SELECT Product_Category, Product_sub_Category, Sales
FROM KMS_Sql_Case_Study
WHERE Region = 'Ontario';


----- REVENUE FOR BOTTOM 10 CUSTOMER
SELECT TOP 10 Customer_Name, SUM(Sales) AS TotalSales
FROM KMS_Sql_Case_Study
GROUP BY Customer_Name
ORDER BY TotalSales ASC

---- SHIPPING METHOD THAT INCURED THE MOST SHIPPING COST

SELECT Ship_Mode, sum(Shipping_Cost) AS Total_Shipping_Cost
FROM KMS_Sql_Case_Study
GROUP BY Ship_Mode
ORDER BY Total_Shipping_Cost DESC

----- The most shipping cost was incured using Delivery Truck

----CASE SCENARIO II

---- MOST VALUABLE CUSTOMERS AND THE PRODUCTS OR SERVCES THEY PURCHASE

SELECT* FROM KMS_Sql_Case_Study

----- MOST VALUABLE CUSTOMERS

SELECT TOP 10 Customer_Name, SUM(Sales) AS TotalSales
FROM KMS_Sql_Case_Study
GROUP BY Customer_Name
ORDER BY TotalSales DESC

------ PRODUCTS/SERVICES THEY PURCHASED

SELECT Customer_Name, Product_Category, SUM(Sales) AS CategorySales
FROM KMS_Sql_Case_Study
WHERE Customer_Name IN (
  SELECT top 10 Customer_Name
  FROM KMS_Sql_Case_Study
  GROUP BY Customer_Name
  ORDER BY SUM(Sales) DESC
  )
GROUP BY Customer_Name, Product_Category
ORDER BY Customer_Name, CategorySales DESC


---- PRODUCTS SMALL BUSINESS CUSTOMER WITH HIGHEST SALES


SELECT *
FROM KMS_Sql_Case_Study

SELECT Customer_Name,SUM(SALES) AS HIGHEST_SMALL_BUSINESS_SALES
FROM KMS_Sql_Case_Study
WHERE CUSTOMER_SEGMENT = 'SMALL BUSINESS'
GROUP BY Customer_Name
ORDER BY HIGHEST_SMALL_BUSINESS_SALES DESC

SELECT TOP 1 Customer_Name,SUM(SALES) AS HIGHEST_SMALL_BUSINESS_SALES
FROM KMS_Sql_Case_Study
WHERE CUSTOMER_SEGMENT = 'SMALL BUSINESS'
GROUP BY Customer_Name
ORDER BY HIGHEST_SMALL_BUSINESS_SALES DESC


----- CUSTOMER WHO PLACED THE MOST NUMBER OF ORDERS FROM 2009 - 2012

SELECT Customer_Name, sum(order_quantity) as Total_Order_Quantity
FROM KMS_Sql_Case_Study
WHERE Customer_Segment = 'Corporate'
GROUP BY Customer_Name 
ORDER BY Total_Order_Quantity DESC

SELECT TOP 1 Customer_Name, COUNT(order_quantity) AS Order_Count
FROM KMS_Sql_Case_Study
WHERE Customer_Segment = 'Corporate'
  AND Order_Date BETWEEN '2009' AND '2012'
GROUP BY Customer_Name
ORDER BY Order_Count DESC


----- MOST PROFITABLE CONSUMER CONSTUMER

SELECT Customer_Name, SUM(Profit) AS Total_Profit
FROM KMS_Sql_Case_Study
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY Total_Profit DESC

SELECT TOP 1 Customer_Name, SUM(Profit) AS Total_Profit
FROM KMS_Sql_Case_Study
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY Total_Profit DESC

------ CUSTOMERS WHO RETURNED ITEMS AND THE SEGMENT THEY BELONG TO
SELECT * FROM [dbo].[Order_Status]

----- JOINING KSM TABLE AND ORDER STATUS TABLE

select distinct * 
from KMS_Sql_Case_Study left join [dbo].[Order_Status]
on KMS_Sql_Case_Study.Order_ID = [dbo].[Order_Status].Order_ID



------ SHIPPING COST VS ORDER PRIORITY
SELECT * FROM [dbo].[KMS_Sql_Case_Study]


SELECT Ship_mode, Order_Priority, SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM [dbo].[KMS_Sql_Case_Study]
GROUP BY Ship_mode, Order_Priority
ORDER BY Order_Priority, Total_Shipping_Cost DESC

alter table [dbo].[KMS_Sql_Case_Study]
alter column Shipping_Cost decimal (10,2)