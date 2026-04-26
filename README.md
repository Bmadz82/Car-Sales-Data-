** Car Sales Analysis Case Study: Bright Motors

 **Project Overview**
This project involves a comprehensive data analysis of over 558,000 vehicle sales records. The goal was to provide the Head of Sales at Bright Motors with actionable insights regarding revenue drivers, customer preferences, and inventory optimization.

By leveraging SQL for data transformation and Power BI for visualization, I identified key trends that could significantly increase dealership profit margins and inventory turnover.

**Tech Stack**
SQL: Data cleaning, Feature Engineering (Profit Margins), and Aggregations.

Power BI: Interactive Dashboards and Trend Analysis.

Databrick, Initial data exploration and statistical validation.

Miro: Project planning and strategic roadmap visualization.

**Data Cleaning & Transformation**
To ensure financial accuracy, the following steps were taken:

Standardization: Converted sellingprice and manufacturer costs into numeric formats using CAST functions to handle billions in Rands.

Handling Nulls: Filtered out incomplete records to prevent skewed averages.

Feature Engineering: * Calculated Profit Amount and Profit Margin %.

Categorized vehicles into Condition Tiers (Excellent, Good, Poor).

Segmented mileage into brackets (Low, Mid, High).

SQL
-- Example logic for Margin Tiering
CASE 
    WHEN profit_margin_pct > 10 THEN 'High Margin'
    WHEN profit_margin_pct >= 0 THEN 'Medium Margin'
    ELSE 'Low Margin'
END AS performance_tier

Key Insights & Findings
1. The Revenue Engines
Ford and Nissan are the primary revenue drivers.

The Ford F-150 is the top-selling model, generating over R 272 Million alone.

2. Transmission Market Shift
96.5% of sales are Automatic transmissions.

Automatic vehicles sell for an average of R 2,445 more than manual counterparts.

Recommendation: Phase out manual inventory to increase lot turnover.

3. Condition vs. Profitability
Vehicles in the "Excellent" (40-50 score) tier yield the highest profit margins.

Investing in minor reconditioning to move "Good" cars into "Excellent" status provides a high ROI.

🚀 Business Recommendations
Inventory Pivot: Allocate 100% of the standard stock budget to Automatic vehicles.

Refurbishment Strategy: Implement a mandatory detailing/minor repair protocol for cars with a condition score of 35+ to push them into the higher-margin "Excellent" bracket.

Top Seller Training: Analyze the sales processes at high-performing locations (e.g., Nissan-Infiniti LT) and standardize them across all branches.

📂 Project Structure
Plaintext
├── Data/               # Raw and Cleaned CSV files
├── SQL/                # Master analysis script (CTEs, Aggregations)
├── PowerBI/            # .pbix file or Dashboard screenshots
├── Documentation/      # Project Plan (Miro) and PowerPoint Presentation
└── README.md           # Project summary
📞 Contact
Belinda Madzhie : Junior Data Analyst (https://www.linkedin.com/in/belinda-n-madzhie-30a80429/)

https://beacon-insight-show.lovable.app
