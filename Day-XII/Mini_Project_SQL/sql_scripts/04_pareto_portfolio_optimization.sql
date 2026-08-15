with product_sales as(
SELECT
Product_Name,
Division,
round(sum(Sales),2) as total_sales
from dbo.silver_sales_table
group by Product_Name,Division
),

Cumulative_Revenue as (
select 
Product_Name,
Division,
total_sales,
sum(total_sales)over(order by total_sales desc) as running_total,
sum(total_sales)over() as overall_total_sales
from product_sales
)

select 
Product_Name,
Division,
total_sales,
round((running_total/overall_total_sales)*100,2) as cumulative_pct,
case
when (running_total/overall_total_sales) <= 0.80 then 'Tier 1(core 80% driver)'
else 'Tier 2 (long tail)'
end as tier
from Cumulative_Revenue
order by total_sales desc;

