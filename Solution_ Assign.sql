
-- Q1. Find the top 10 best-value products based on the discount percentage.

select top 10 * from Zepto order by discountpercent desc


--Q2.What are the Products with High MRP but Out of Stock
select * from Zepto where outOfstock = 'true' order by mrp desc 

--Q3.Calculate Estimated Revenue for each category

select category,sum(discountedSellingPrice*quantity) as [Revenue] from dbo.Zepto group by Category

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct [name],mrp, discountPercent from dbo.zepto where 500 < mrp and discountPercent < 10

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

select top 5 category, avg(discountPercent) as [avg] from dbo.zepto group by [Category] order by [avg] desc

-- Q6. Find the price per gram for products above 100g and sort by best value.

select distinct name,weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as [Price_Per_Gram] from zepto 
where 100 <= weightInGms order by Price_Per_Gram desc

--Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name, weightInGms,
case when 5000 < weightInGms then 'Bulk'
			when 1000 < weightInGms then 'Medium'
			else 'Low' end as [Status]
			 from zepto


--Q8.What is the Total Inventory Weight Per Category

select Category,cast(sum([weightInGms]*[quantity]) as bigint)[weight] from zepto group by category

--EXEC sp_help 'zepto';

--alter table zepto
--alter column weightInGms int