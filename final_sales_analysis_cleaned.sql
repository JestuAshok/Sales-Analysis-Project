

 -- 📊 SUPERSTORE SALES ANALYSIS PROJECT (FINAL)
 -- Using table: cleaned_superstore_data


USE sales_analysis;

-- Step 1: Basic Info
SELECT COUNT(*) AS Total_Records FROM cleaned_superstore_data;
SELECT DISTINCT Region FROM cleaned_superstore_data;
SELECT DISTINCT Category FROM cleaned_superstore_data;

-- Step 2: Total Sales and Profit
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM cleaned_superstore_data;

-- Step 3: Profit Margin
SELECT 
    ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin_Percentage
FROM cleaned_superstore_data;

-- Step 4: Sales by Region
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM cleaned_superstore_data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Step 5: Sales by Category
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM cleaned_superstore_data
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Step 6: Top 10 Profitable Products
SELECT 
    'Product name',
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM cleaned_superstore_data
GROUP BY 'Product name'
ORDER BY Total_Profit DESC
LIMIT 10;

-- Step 7: Monthly Sales Trend
SELECT 
    DATE_FORMAT('Order Date', '%Y-%m') AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM cleaned_superstore_data
GROUP BY Month
ORDER BY Month;

-- Step 8: Top 5 Customers by Profit
SELECT 
    'Customer Name',
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM cleaned_superstore_data
GROUP BY 'Customer Name'
ORDER BY Total_Profit DESC
LIMIT 5;

-- Step 9: Most Frequently Ordered Sub-Categories
SELECT 
    'Sub Category',
    SUM(Quantity) AS Total_Quantity
FROM cleaned_superstore_data
GROUP BY 'Sub Category'
ORDER BY Total_Quantity DESC
LIMIT 10;

-- Step 10: Average Discount by Category
SELECT 
    Category,
    ROUND(AVG(Discount), 2) AS Avg_Discount
FROM cleaned_superstore_data
GROUP BY Category
ORDER BY Avg_Discount DESC;

-- Step 11: Yearly Sales Growth
SELECT 
    YEAR('Order Date') AS Year,
    ROUND(SUM(Sales), 2) AS Yearly_Sales,
    ROUND(SUM(Profit), 2) AS Yearly_Profit
FROM cleaned_superstore_data
GROUP BY YEAR ('Order Date')
ORDER BY Year;

-- Step 12: Average Shipping Delay
SELECT 
    ROUND(AVG(DATEDIFF('Ship Date', 'Order Date')), 2) AS Avg_Shipping_Days
FROM cleaned_superstore_data;

-- Step 13: Top 5 States by Profit Margin
SELECT 
    State,
    ROUND((SUM(Profit)/SUM(Sales))*100, 2) AS Profit_Margin
FROM cleaned_superstore_data
GROUP BY State
ORDER BY Profit_Margin DESC
LIMIT 5;

-- Step 14: Segment-Wise Performance
SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Discount), 2) AS Avg_Discount
FROM cleaned_superstore_data
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Step 15: Sales Distribution by Weekday
SELECT 
    DAYNAME('Order Date') AS Day,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM cleaned_superstore_data
GROUP BY Day
ORDER BY FIELD(Day, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- Step 16: Orders with High Discount but Negative Profit
SELECT 
    'Order ID',
    'Product Name',
    Discount,
    Profit
FROM cleaned_superstore_data
WHERE Discount > 0.3 AND Profit < 0
ORDER BY Discount DESC;

-- Step 17: Correlation Between Discount and Profit (approx. trend)
SELECT 
    ROUND(Discount, 2) AS Discount_Level,
    ROUND(AVG(Profit), 2) AS Avg_Profit
FROM cleaned_superstore_data
GROUP BY Discount_Level
ORDER BY Discount_Level;

-- Step 18: Category Performance by Region
SELECT 
    Region,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM cleaned_superstore_data
GROUP BY Region, Category
ORDER BY Region, Total_Profit DESC;

-- ==============================================
-- ✅ END OF ANALYSIS
-- ==============================================



describe cleaned_superstore_data;


