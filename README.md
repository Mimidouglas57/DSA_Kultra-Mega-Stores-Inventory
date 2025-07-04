# DSA_Kultra-Mega-Stores-Inventory
This project presents a data-driven sales analysis for Kultra Mega Stores (KMS), a Nigerian company specializing in office supplies and furniture. Using SQL and Excel, I explored customer trends, sales performance, product profitability, and logistics costs across multiple years (2009–2012).

## 📚 Table of Contents

- [📌 Project Overview](#-project-overview)
- [📊 Dataset Description](#-dataset-description)
- [🧹 Data Cleaning & Preparation](#-data-set-cleaning-&-preparation)
- [❓ Business Questions Answered](#-business-questions-answered)
- [🛠️ Tools & Technologies Used](#️-tools--technologies-used)
- [📁 File Structure](#-file-structure)
- [🔍 Key Insights & Recommendations](#-key-insights--recommendations)
- [📊 SQL Queries & Visualizations](#-SQL-Queries-&-visualizations)

- [👤 Author](#-author)

📌 Project Overview

This project analyzes sales data for Kultra Mega Stores (KMS) — a Nigerian retailer of office supplies and furniture — focusing on its Abuja operations from 2009 to 2012. The goal is to uncover trends in sales, customer behavior, product performance, and shipping efficiency.

Using SQL, Excel, and Power BI, the analysis answers key business questions around top-selling products, most valuable customers, regional performance, and cost-effective shipping. The insights support strategic decisions to boost revenue, optimize logistics, and better serve customers.
 
## 📊 Dataset Description

The dataset used for this analysis was provided by Kultra Mega Stores (KMS) and includes detailed order records from **2009 to 2012**, specifically from the **Abuja division**. It is structured across two CSV files:
- KMS SQL Case Study.csv
- Order_Status.csv

  ## 🧹 Data Cleaning & Preparation

The raw order data was cleaned and transformed to enable accurate analysis. Key steps included:

- **Merged Datasets:** Combined orders and return status using `Order ID`.
- **Formatted Dates:** Standardized date format and extracted year/month.
- **Handled Missing Values:** Checked for and resolved any nulls in key fields.
- **Corrected Data Types:** Ensured numerical and categorical fields were properly typed.
- **Removed Duplicates:** Eliminated duplicate order records.
- **Created New Fields:** Added `Order Year`, `Order Month`, and `Return Flag` columns.
- **Standardized Regions/Provinces:** Fixed inconsistencies in location names.

These steps ensured the data was clean, consistent, and ready for SQL, Excel, and Power BI analysis.

## ❓ Business Questions Answered

1. Which product category had the highest sales?
2. What are the top and bottom regions in terms of sales?
3. What were the total sales of appliances in Ontario?
4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
5. KMS incurred the most shipping cost using which shipping method?
6. Who are the most valuable customers, and what products or services do they typically purchase?
7. Which small business customer had the highest sales?
8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
9. Which consumer customer was the most profitable one?
10. Which customer returned items, and what segment do they belong to?
...

## 🛠️ Tools & Technologies Used
- SQL Server Management Studio (SSMS) 
- SQL (Subqueries, Aggregration,Joins, Grouping)
- Excel (To export data)
- GitHub (Project Documentation)


## 📁 File Structure

## 📊 SQL Queries & Visualization

``` sql

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
WHERE [Status] = 'Returned'


select distinct customer_name, customer_segment,[Status] 
from KMS_Sql_Case_Study left join [dbo].[Order_Status]
on KMS_Sql_Case_Study.Order_ID = [dbo].[Order_Status].Order_ID
WHERE [Status] = 'Returned'


------ SHIPPING COST VS ORDER PRIORITY
SELECT * FROM [dbo].[KMS_Sql_Case_Study]


SELECT Ship_mode, Order_Priority, SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM [dbo].[KMS_Sql_Case_Study]
GROUP BY Ship_mode, Order_Priority
ORDER BY Order_Priority, Total_Shipping_Cost DESC

alter table [dbo].[KMS_Sql_Case_Study]
alter column Shipping_Cost decimal (10,2)

SELECT Ship_mode, Order_Priority, count(order_id) as Order_count, SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM [dbo].[KMS_Sql_Case_Study]
GROUP BY Ship_mode, Order_Priority
ORDER BY Order_Priority, Total_Shipping_Cost DESC

SELECT 
    Ship_mode,
    Order_Priority,
	count(order_id) as Order_count,
    SUM(Sales - Profit) AS estimated_shipping_cost,
    AVG(DATEDIFF(DAY, order_date, ship_date)) AS avgshipdays
FROM dbo.KMS_Sql_Case_Study
GROUP BY Ship_mode, Order_Priority
ORDER BY Order_Priority, estimated_shipping_cost DESC;
```

### Tables

**KSM SQL CASE STUDY**

![Cleaned Imported Table](https://github.com/user-attachments/assets/ad673b31-924c-40d1-b403-f02deb02a8a6)

- Top 3 and Bottom 3 Regions in terms of sales

![Top 3   Bottom 3 Sales Regions](https://github.com/user-attachments/assets/5a9a54c7-298d-4bf9-9d58-a4aefeb49b8a)


- Total Sales of Appliance in Ontario

  ![Total Appliance Sales in Ontario](https://github.com/user-attachments/assets/b22db811-75e2-49f7-b293-a868d518958b)

- Botto 10 customers

![Bottom 10 Customers](https://github.com/user-attachments/assets/b9904d3b-001d-4af7-88b9-5e4e519f5a21)

  - Shipping Method that Incured the Most Shipping Cost

    ![Most Shipping Cost   Method](https://github.com/user-attachments/assets/0dd0f457-d185-4f0c-ab7e-ca17b2b549e7)

- Top 5 Most Valuable Customer and the Product/Servce they Purchase

![Top 5 Most Valuable Customers](https://github.com/user-attachments/assets/158b030c-c868-4552-a5ec-945050790e07)


- Small Business Customer with Highest Sales

![Small Business Customer with Highest Sales](https://github.com/user-attachments/assets/5ed3f1c0-fac1-47f1-995f-92a666391d20)


- Corporate Customer with Most Orders from 2009 - 2012

![Corporate Customer with Most Orders](https://github.com/user-attachments/assets/591d9fd0-cdea-4639-bc4d-fa35ec12d479)


- Most Profitable Consumer customer

![Most Profitable Customer (2)](https://github.com/user-attachments/assets/4a8d8d69-6642-47a7-8468-2862dfff5111)



- Customers that Returned Items and the Segment they Belong to

  ![customer Returned items](https://github.com/user-attachments/assets/27a426d6-2eb9-4809-951f-6a7e524acb2d)



- Shipping Method & Cost

  ![Delivery Methods   Cost](https://github.com/user-attachments/assets/65c5be23-03a5-4316-87c0-8f3d22c9026a)

##[🔍 Key Insights & Recommendations]

1. **Top Category:**  
   Technology is the highest revenue-generating category (₦5.98M).
   - Recommend focusing promotions and stock on this category.

2. **Regional Sales:**  
   West, Ontario, and Prarie are the top-performing regions.
   Yukon, Northwest Territories and Nunavut had the lowest sales with ₦975K, ₦800k and ₦116k respectively
   	— consider geo-targeted awareness campaigns.
   
3. **Total Sales of Appliances in Ontario**
	The total sale was 202,346.839

4. **Low-Spending Customers:**  
   Bottom 10 customers spent less than ₦500.
  	 - Recommend offering loyalty discounts or bundling strategies to increase spend.
      	- Improve Company-Customer relationship
        - 	Product Improement

5. **Shipping Cost Drivers:**  
   Delivery Truck has the highest shipping cost with a total cost of ₦51,971.94 , likely due to volume.
   - Monitor cost-effectiveness in low-margin transactions.

6. **Most Valuable Customers:**  
   Top 5 customers heavily purchase office supplies and technology.
 	  - Consider exclusive packages or subscription models.

7. **Small Business Leader:**  
   Dennis Kane dominated small business purchases with a total sale of ₦75,967.59
   	— create a VIP tier or repeat-order program.

8. **Corporate Champion:**  
   Highest-order corporate customer was Adam Hart with a Total of 19 orders, this offers consistent demand
   	— consider account-based pricing.

9. **Most Profitable Consumer:**  
   Emily Phan, a consumer customer generated the highest net profit with a profit of ₦34,005.44
   	-  study their basket and identify upsell opportunities.

10. **Return Behavior:**  
   A total number of 573 Customers returned Items and these returns came from specific segments.
	- Analyze return reasons to reduce reverse logistics costs.

11. **Order Priority vs Shipping Mode:**  
   Shipping cost aligns with order priority overall, but a few high-priority orders used slower methods.
	- Flag for logistics audit.



