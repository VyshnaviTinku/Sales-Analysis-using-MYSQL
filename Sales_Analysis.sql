create database company;
use company;

-- Q1. find all orders shipped via 'Economy' mode with a total amount greater than $25k.
select * from Sales where Ship_Mode='Economy' and total_Amount > 25000;

-- Q2. Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01. 
Select * from sales where Category='Technology' and Country='Ireland' and Order_date>'2020-01-01';

-- Q3. List the top 10 most profitable sales transaction in descending order
select * from sales order by Unit_Profit DESC limit 10;    -- top 10 transaction

-- Q4. Next top 20 records
select * from sales order by Unit_Profit DESC limit 10,20;    -- skip 10 records, showing next 20 records

-- Q5. Find all customers whose name starts with 'j' and ends with 'n'.
select Customer_name,Order_ID from sales where Customer_Name like 'J%N';

-- Q6. Retrieve all product names that contain 'Acco' anywhere in the same
Select Order_ID,Product_Name from sales where Product_name like '%Acco%';

-- Q7. Get the top 5 cities with the highest total sales amount
Select city,Sum(Total_Amount) as Total_sales from sales Group by City order by Total_sales desc limit  5;

-- Q8. Display the second set of 10 records for Customer_Name and total_Amount in desc order
select  Customer_Name,total_Amount from sales  order by  total_amount desc limit 10 offset 10 ;

-- Q9. Find the total revenue,average unit cost, and total number of orders.
select sum(Total_Amount) as Total_revenue,avg(Unit_cost) as Average_Cost,count(order_Id) as Total_order from sales;

-- Q10. Count unique number of regions
select count(distinct region) as Unique_region from sales;

-- Q11. Find the number of orders placed by each customer
select customer_name,count(Order_Id) as Order_count from sales group by Customer_Name order by Order_count desc;

-- Q12. Rank 5 products based on total sales using RANK().
select Product_Name,sum(total_amount) as Total_sales, 
    RANK() OVER (order by sum(total_amount) desc) as sales_rank
 from sales group by Product_name limit 5;   
    