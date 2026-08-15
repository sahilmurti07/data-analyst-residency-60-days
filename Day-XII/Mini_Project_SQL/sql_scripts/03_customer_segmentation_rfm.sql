with customer_metrics as (
select 
Customer_ID,
COUNT(DISTINCT Order_ID) AS Total_Orders,
        ROUND(SUM(Sales), 2) AS Total_Spend,
        ROUND(AVG(Sales), 2) AS Avg_Order_Value,
        MAX(Order_Date) AS Last_Order_Date,
        DATEDIFF(day, MAX(Order_Date), (SELECT MAX(Order_Date) FROM dbo.silver_sales_table)) AS Days_Since_Last_Order
    FROM dbo.silver_sales_table
    GROUP by Customer_ID
    )

    select 
    Customer_ID,
    Total_Orders,
    Total_Spend,
    Avg_Order_Value,
    Days_Since_Last_Order,
    CASE 
        WHEN Total_Spend >= 75 AND Days_Since_Last_Order <= 100 THEN 'VIP / Active'
        WHEN Total_Spend >= 75 AND Days_Since_Last_Order > 100 THEN 'VIP / At-Risk'
        WHEN Total_Orders > 5 THEN 'Frequent Buyer'
        ELSE 'Standard Buyer'
    END AS Customer_Segment
FROM customer_metrics
ORDER BY Total_Spend DESC;
