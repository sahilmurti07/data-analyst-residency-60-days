WITH actual_sale AS (
    SELECT 
        Division,
        ROUND(SUM(Sales), 2) AS total_sales
    FROM dbo.silver_sales_table
    WHERE YEAR(Order_Date) = 2024
    GROUP BY Division
)
SELECT 
    a.Division,
    CASE
        WHEN a.total_sales >= t.Target THEN 'Achieve'
        WHEN a.total_sales < t.Target THEN 'Not Achieve'
    END AS Performance_Status
FROM actual_sale a 
JOIN bronze_targets t 
    ON a.Division = t.Division;
