select*
from marketing_data_simulated
limit 10;
SELECT *
FROM marketing_data_simulated
WHERE Date IS NULL
   OR Action_Type IS NULL
   OR Language IS NULL
   OR Content_Category IS NULL
   OR Day_of_Week IS NULL
   OR Impressions IS NULL
   OR CTR IS NULL
   OR Clicks IS NULL;
SELECT Date,
       Action_Type,
       Language,
       Content_Category,
       Day_of_Week,
       Impressions,
       CTR,
       Clicks,
       COUNT(*) AS duplicate_count
FROM marketing_data_simulated
GROUP BY Date,
         Action_Type,
         Language,
         Content_Category,
         Day_of_Week,
         Impressions,
         CTR,
         Clicks
HAVING COUNT(*) > 1;
SELECT 
    SUM(Impressions) AS Total_Impressions,
    SUM(Clicks) AS Total_Clicks
FROM marketing_data_simulated;
SELECT 
    AVG(CTR) AS Average_CTR
FROM marketing_data_simulated;
SELECT 
    Content_Category,
    SUM(Clicks) AS Total_Clicks,
    AVG(CTR) AS Avg_CTR
FROM marketing_data_simulated
GROUP BY Content_Category
ORDER BY Total_Clicks DESC;
SELECT 
    Action_Type,
    SUM(Impressions) AS Total_Impressions,
    SUM(Clicks) AS Total_Clicks,
    AVG(CTR) AS Avg_CTR
FROM marketing_data_simulated
GROUP BY Action_Type
ORDER BY Total_Clicks DESC;
SELECT 
    Day_of_Week,
    AVG(CTR) AS Avg_CTR,
    SUM(Clicks) AS Total_Clicks
FROM marketing_data_simulated
GROUP BY Day_of_Week
ORDER BY Avg_CTR DESC;
SELECT 
    Language,
    SUM(Clicks) AS Total_Clicks,
    AVG(CTR) AS Avg_CTR
FROM marketing_data_simulated
GROUP BY Language
ORDER BY Total_Clicks DESC;
SELECT 
    MONTH(Date) AS Month_Number,
    MONTHNAME(Date) AS Month_Name,
    SUM(Clicks) AS Total_Clicks,
    SUM(Impressions) AS Total_Impressions
FROM marketing_data_simulated
GROUP BY MONTH(Date), MONTHNAME(Date)
ORDER BY Month_Number;
SELECT 
    Content_Category,
    SUM(Clicks) AS Total_Clicks,
    RANK() OVER(ORDER BY SUM(Clicks) DESC) AS Category_Rank
FROM marketing_data_simulated
GROUP BY Content_Category;
SELECT Action_Type,
       Content_Category,
       Language,
       SUM(Clicks) AS Total_Clicks,
       AVG(CTR) AS Avg_CTR
FROM marketing_data_simulated
GROUP BY Action_Type,
         Content_Category,
         Language
ORDER BY Avg_CTR DESC
LIMIT 10;
SELECT Action_Type,
       SUM(Clicks) / SUM(Impressions) AS Engagement_Rate
FROM marketing_data_simulated
GROUP BY Action_Type
ORDER BY Engagement_Rate DESC; 


