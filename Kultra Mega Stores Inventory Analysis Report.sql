create database [Kultra Mega Stores Inventory]

select * from [KMS Sql Case Study]

-----1--which product category had the highest Sales 

select top 1 Product_Category, SUM (Sales) as [Total Sales] from [KMS Sql Case Study]
Group by Product_Category 
Order by [Total Sales] desc
 

 -----2---what are the Top 3 and Bottom 3 Region in terms of Sales----

 ------Top 3 Region in terms of sales
select top 3 Region, sum(Sales) as [Total Sales] from [KMS Sql Case Study]
Group by Region
Order by [Total Sales] desc 

-------Bottom 3 Region in terms of sales 
select top 3 Region, sum(Sales) as [Total Sales] from [KMS Sql Case Study]
Group by Region
Order by [Total Sales] asc 

   
-----3--- what were the Total Sales of Appliance in Ontario

select Region, sum(Sales) as [Total Sales of Appliance] from [KMS Sql Case Study]
where Province = 'Ontario'
And Product_Sub_Category = 'Appliances'
group by Region


-----4---- Advice the managment of KMS on what to do to increase the revenue from the bottom 10 customers

select top 10 Customer_Name,  sum(Sales) as [Total Sales] from [KMS Sql Case Study]
Group by Customer_Name
Order by [Total Sales] asc 

---Advice to the management of KMS
--1.	Management should improve delivery or suppourt in their respective Region
--2.	Assign dedicated account manager for better service in those region  
   
   
-----5--KMS incurred the Most Shipping Cost using which Shipping method

select Ship_Mode, sum(Shipping_Cost) as Total_Shipping_Cost from [KMS Sql Case Study]
Group by Ship_Mode
Order by Total_Shipping_Cost  desc 
 

---6--- who are the most Valuable Customers and what Products or Services do they typically purchase----

select [Customer_Name], Sum(Sales) as Total_Sales, Product_Category from [KMS Sql Case Study]  
Group by Product_Category, Customer_Name
Order by Total_Sales desc


----7-----Which small business customer had the highest sales-----

select Customer_Name, Sales  from [KMS Sql Case Study]
where Customer_Segment = 'Small Business'  
Order by Sales desc 


-----8---Which Corporate customer placed the most number of orders in 2009-2012

 select top 1 Customer_Name, Count(Order_ID)  as Total_Orders from [KMS Sql Case Study]
Where Customer_Segment = 'Corporate'
and Order_Date between  '2009-01-01' and '2012-12-31'
Group by Customer_Name
 Order by [Total_Orders] desc 

 
 ------9--Which customer was the most profitable one 

select top 1 Customer_Name, Sum(Profit) as Total_Profit from [KMS Sql Case Study]
Where Customer_Segment = 'Consumer'
Group by Customer_Name
Order by Total_Profit desc


-------UNION----------

Select * from dbo.[KMS Sql Case Study] KMS
Join Order_Status OS
on KMS.Order_ID = OS.Order_ID  


------10---Which customer returned items and what segiment do they belong to

Select distinct 
KMS.Customer_Name, KMS.Customer_Segment from [KMS Sql Case Study] KMS
Join Order_Status OS
on KMS.Order_ID = OS.Order_ID  
WHERE OS.Status = 'Returned'


------11--- if the delivery truck is the most economical but the slowest and shipping method and the Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs base on the order of priority

-----Shipping cost breakdown by priority 
Select Order_Priority, Ship_Mode, Sum(Shipping_Cost) as Total_Shipping_Cost from [KMS Sql Case Study]
Group by Order_Priority, Ship_Mode
Order by Order_Priority, Total_Shipping_Cost desc

-----Order count by shipping method and priority
Select Order_Priority, Ship_Mode, Count(*) as Order_Count from [KMS Sql Case Study]
Group by Order_Priority, Ship_Mode
Order by Order_Priority, Order_Count desc 

-----	With the analysis above the company did not consistently match the shipping cost with order urgency.
-----	Delivery truck, the cheapest, was used across all priority levels, not just for low or medium priority
-----	Express air, the most expensive, was also used heavily for low and medium priority order, not just for the critical ones  






