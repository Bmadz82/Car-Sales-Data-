select * from `workspace`.`default`.`car_sales_data` limit 100;
----------------------------------------------------
----Fixing  year manufacturing 
ALTER TABLE car_sales_data 
RENAME COLUMN `mmr` TO cost_price;
----------------------------------------------------
-----Create a cleaned version of the table
DELETE FROM car_sales_data 
WHERE sellingprice IS NULL OR make IS NULL;
------------------------------------------------

---Casting the column to a numeric type
SELECT CAST(sellingprice AS FLOAT) as sellingprice_numeric
FROM car_sales_data;

---------------------------------------------------------------------------------------------
-- STEP 2: ANSWERING THE BUSINESS QUESTIONS
---------------------------------------------------------------------------------------------
----
  -----Total revenue:
 SELECT 
    SUM(CAST(sellingprice AS FLOAT)) AS total_revenue,
    COUNT(*) AS total_rows
FROM car_sales_data
WHERE sellingprice IS NOT NULL;

----Querry1 : The car makes and models generate the most revenue
SELECT 
    -- This gives you the Money (Revenue)
    SUM(CAST(sellingprice AS FLOAT)) AS actual_total_revenue,
    
    -- This gives you the Number of Cars (Volume)
    COUNT(*) AS total_units_sold
FROM car_sales_data;

---Querry 2--The relationship between price, mileage, and year of manufacture
----Price vs. Year of Manufacture
SELECT 
    year AS manufacture_year, 
    AVG(sellingprice) AS avg_selling_price,
    COUNT(*) AS volume
FROM car_sales_data
GROUP BY year
ORDER BY year DESC;
------Price vs. Mileage (Usage Impact)
    Select
    CASE 
        WHEN odometer < 20000 THEN '01: 0 - 20k km'
        WHEN odometer < 50000 THEN '02: 20k - 50k km'
        WHEN odometer < 100000 THEN '03: 50k - 100k km'
        WHEN odometer < 150000 THEN '04: 100k - 150k km'
        ELSE '05: 150k km +'
    END AS mileage_range,
    AVG(sellingprice) AS avg_selling_price,
    AVG(condition) AS avg_condition_score
FROM car_sales_data
GROUP BY mileage_range
ORDER BY mileage_range ASC;
--------------------------------------------------------------
---Which regions or locations have the highest sales volume
SELECT 
    seller, 
    COUNT(seller) AS units_sold,
    SUM(sellingprice) AS total_revenue,
    ROUND(AVG(sellingprice), 2) AS avg_price
FROM car_sales_data
GROUP BY seller
ORDER BY units_sold DESC
LIMIT 10;


-----------------------------------------------------------------------
----Emerging trends in customer purchasing preferences
-----Top Body Styles (Market Share)
SELECT 
    LOWER(body) AS body_style, 
    COUNT(make) AS units_sold,
    ROUND(COUNT(body) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS market_share_pct
FROM car_sales_data
GROUP BY LOWER(body)
ORDER BY units_sold DESC
LIMIT 5;
----------------------------------------------------------------------
-------Transmission Preference: This helps decide if you should even bother buying manual cars for the inventory
SELECT 
    transmission, 
    COUNT(transmission) AS units_sold,
    AVG(sellingprice) AS avg_price
FROM car_sales_data
WHERE transmission IS NOT NULL
GROUP BY transmission;
------------------------------------------------------------------------------------
-------Popular Colors (Exterior & Interior): Visual appeal is a huge driver in sales.
SELECT 
    color AS exterior_color, 
    interior AS interior_color,
    COUNT(*) AS popularity_score
FROM car_sales_data
GROUP BY color, interior
ORDER BY popularity_score DESC
LIMIT 10;
------------------------------------------------------------------------------------
-----Recommendations to increase dealership profitability and efficiency: to track condition profitability
-------------------------------------------------------------
SELECT 
    CASE 
        WHEN condition >= 40 THEN 'Excellent (40-50)'
        WHEN condition >= 30 THEN 'Good (30-39)'
        ELSE 'Poor (<30)'
    END AS condition_tier,
    AVG(cost_price) AS avg_cost_price,
    AVG(sellingprice) AS avg_selling_price,
    AVG(sellingprice - cost_price) AS avg_margin,
    COUNT(*) AS volume
FROM car_sales_data
GROUP BY 1
ORDER BY avg_margin DESC;
