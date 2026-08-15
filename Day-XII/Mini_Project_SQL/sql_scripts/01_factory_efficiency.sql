SELECT 
    t2.Factory,
    t1.`Country/Region`,
    SUM(t1.Units) AS Total_Units_Produced,
    ROUND(SUM(t1.Sales), 2) AS Total_Revenue,
    ROUND(SUM(t1.Cost), 2) AS Total_Cost,
    ROUND(SUM(t1.Gross_Profit), 2) AS Total_Profit,
    ROUND((SUM(t1.Gross_Profit) / NULLIF(SUM(t1.Sales), 0)) * 100, 2) AS Profit_Margin_Pct,
    ROUND(SUM(t1.Cost) / NULLIF(SUM(t1.Units), 0), 2) AS Cost_Per_Unit
FROM dbo.silver_sales_table t1
JOIN dbo.bronze_products t2
    ON t1.Product_ID = t2.Product_ID
GROUP BY 
    t2.Factory,
    t1.`Country/Region`
ORDER BY Cost_Per_Unit
