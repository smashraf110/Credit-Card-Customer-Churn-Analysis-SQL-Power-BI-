#_____________________Explorative Data Analysis (EDA)_______________________#



##______________Demographic Analysis__________________##


## Total customers count
select count(*) as total_customers
from bank_churners_1;

## How many have churned? What is the percentage of churned?
select Attrition_Flag, count(*) as Attrition_Count,
round(count(*) * 100.0 / sum(count(*)) over(), 1) as Attrition_Ratio
from bank_churners_1
group by Attrition_Flag;
## Found 16.1% customers have churned

## Gender distribution
select Gender, count(*) as Gender_Count,
round(count(*) * 100 / sum(count(*)) over(), 1) as Gender_Percentage
from bank_churners_1
group by Gender;
## Male 47.1% and Female 52.9%


## Age distribution
select max(Customer_Age), min(Customer_Age), avg(Customer_Age)
from bank_churners_1;
# Max age is 73, Min 26 and Average is 46 years


## Attrition Rate by Education Level
SELECT 
    Education_Level,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Attrited_Count_by_Education,
    COUNT(*) AS Total_Customers_by_Education,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate_by_Education
FROM bank_churners_1
GROUP BY Education_Level
ORDER BY Attrition_Rate_by_Education DESC;
## Doctorate degree holders churn rate is 21.1% which is a bit higher than overall churn rate of 16.1%.



## Attrition Rate by Income Category
select
Income_Category,
sum(case when Attrition_Flag = 'Attrited Customer' then 1 else 0 end) as Attrited_Count_by_Income,
count(*) as Total_Customers_by_Income,
round(sum(case when Attrition_Flag = 'Attrited Customer' then 1 else 0 end) * 100 / count(*), 1) as Attrition_Rate_by_Income
from bank_churners_1
group by Income_Category
order by Attrition_Rate_by_Income desc;
## No Income category shows significantly higher churn rate 


## Attrition Rate by Gender distribution
select
Gender,
sum(case when Attrition_Flag = 'Attrited Customer' then 1 else 0 end) as Attrited_Count_by_Gender,
count(*) as Total_Customers_by_Gender,
round(sum(case when Attrition_Flag = 'Attrited Customer' then 1 else 0 end) * 100 / count(*), 1) as Attrition_Rate_by_Gender
from bank_churners_1
group by Gender
order by Attrition_Rate_by_Gender desc;
## Nothing significant



## Attrition Rate by Card Category
select
Card_Category,
sum(case when Attrition_Flag = 'Attrited Customer' then 1 else 0 end) as Attrited_Count_by_Card_Category,
count(*) as Total_Customers_by_Card_Category,
round(sum(case when Attrition_Flag = 'Attrited Customer' then 1 else 0 end) * 100 / count(*), 1) as Attrition_Rate_by_Card_Category
from bank_churners_1
group by Card_Category
order by Attrition_Rate_by_Card_Category desc;
## Platinum cardholders churn rate is 25%


## Attrition Rate by Age group
select
case 
	when Customer_Age <= 35 then 'Below 35'
    when Customer_Age <= 45 then 'Below 45'
    when Customer_Age <= 55 then 'Below 55'
    when Customer_Age > 55 then 'Above 55'
end as Age_Label,
sum(
case 
	when Attrition_Flag = 'Attrited Customer' then 1 else 0 
end) as Attrited_Count_by_Age_Group,
count(*) as Total_Customers_by_Age_Group,
round(sum(case when Attrition_Flag = 'Attrited Customer' then 1 else 0 end) * 100 / count(*), 1) as Attrition_Rate_by_Age_Group
from bank_churners_1
group by Age_Label
order by Attrition_Rate_by_Age_Group desc;
## Nothing significantly higher


## Customer Age and Card Category Analysis
SELECT
    CASE 
        WHEN Customer_Age <= 35 THEN 'Below 35 Years Old'
        WHEN Customer_Age <= 45 THEN '36 - 45 Years Old'
        WHEN Customer_Age <= 55 THEN 'Age 46 - 55 Years Old'
        ELSE 'Above 55 Years Old'
    END AS Age_Label,
    Card_Category,
    count(*) as Total_Customers,
    ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END)*100.0/COUNT(*),1) AS Attrition_Rate
FROM bank_churners_1
GROUP BY Age_Label, Card_Category
ORDER BY Attrition_Rate DESC;
## Age group 46 to 55 years old with Platinum card has 40% churn rate 
## and customers below 35 years old with a Gold card has 30% churn rate


##______________________Behavioral Analysis____________________________________##


##Churn by Average Balance or Usage##
SELECT
  Attrition_Flag,
  ROUND(AVG(Total_Revolving_Bal), 1) AS Avg_Revolving_Bal,
  ROUND(AVG(Total_Trans_Amt), 1) AS Avg_Trans_Amt,
  ROUND(AVG(Credit_Limit), 1) AS Avg_Credit_Limit,
  ROUND(AVG(Avg_Utilization_Ratio), 1) AS Avg_Utilization_Ratio
FROM bank_churners_1
GROUP BY Attrition_Flag;
## Atrrited customers Average Revolving balance is 672.8, Average Transfer Amount is 3095##
##Average Credit Limit is 8136, and Average Utilization Ratio is 20%##
##It seems the Financial behaviors do not fluctuate too much##

## Attrition Rate by Total Relationship Count
SELECT 
  Total_Relationship_Count,
  SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Attrited_Customers,
  COUNT(*) AS Total_Customers,
  ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate
FROM bank_churners_1
GROUP BY Total_Relationship_Count
ORDER BY Attrition_Rate desc;
## relationship count 2 attrition is 27.8% and for count 1 is 25.6% which is a little high

## Attrition Rate by Months on Book
SELECT 
  CASE 
    WHEN Months_on_book < 36 THEN 'Under 3 Years'
    WHEN Months_on_book BETWEEN 36 AND 47 THEN '3-4 Years'
    ELSE 'Over 4 Years'
  END AS Tenure_Group,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Attrited_Customers,
  ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate
FROM bank_churners_1
GROUP BY Tenure_Group
ORDER BY Attrition_Rate DESC;
## over 4 years attrition rate is 16.9% and 3-4 years is 16.7% which is not significant


## Attrition by Contact Frequency
SELECT 
  CASE 
    WHEN Contacts_Count_12_mon <= 2 THEN 'Low Contact (0-2)'
    WHEN Contacts_Count_12_mon < 5 THEN 'Moderate Contact (3-4)'
    ELSE 'Frequent Contact (5+)'
  END AS Contact_Level,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Attrited_Customers,
  ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate
FROM bank_churners_1
GROUP BY Contact_Level
ORDER BY Attrition_Rate DESC;
## Customers contacted frequently (more than 5 times) has churn rate 49%


## Attrition Rate by Relationship Count & Contact Frequency
SELECT 
  Total_Relationship_Count,
  CASE 
    WHEN Contacts_Count_12_mon <= 2 THEN 'Low Contact (0-2)'
    WHEN Contacts_Count_12_mon BETWEEN 3 AND 4 THEN 'Moderate Contact (3-4)'
    ELSE 'Frequent Contact (5+)'
  END AS Contact_Level,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Attrited_Customers,
  ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate
FROM bank_churners_1
GROUP BY Total_Relationship_Count, Contact_Level
ORDER BY Attrition_Rate DESC, Total_Relationship_Count;
## frequently contacted (more than 5 times) with 1 relationship count attrition rate is 100%
## frequently contacted (more than 5 times) with 2 relationship 88.5%


## Attrition Rate by Income, Contact Frequency and Relationship Count
SELECT 
  Income_Category,
  Total_Relationship_Count,
  CASE 
    WHEN Contacts_Count_12_mon <= 2 THEN 'Low Contact (0-2)'
    WHEN Contacts_Count_12_mon BETWEEN 3 AND 4 THEN 'Moderate Contact (3-4)'
    ELSE 'Frequent Contact (5+)'
  END AS Contact_Level,
  COUNT(*) AS Total_Customers,
  SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS Attrited_Customers,
  ROUND(SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS Attrition_Rate
FROM bank_churners_1
GROUP BY Income_Category, Total_Relationship_Count, Contact_Level
ORDER BY Attrition_Rate DESC;
## Frequently contacted customers with relatively low income and low relationship have 100% churn rate

##___________________Churn Risk Scoring Model_________________________##

##Churn Risk Scoring with 2 variables##
SELECT *,
  CASE
    WHEN Total_Relationship_Count <= 2 AND Contacts_Count_12_mon > 4 THEN 'High Risk'
    WHEN Contacts_Count_12_mon BETWEEN 3 AND 4 THEN 'Medium Risk'
    ELSE 'Low Risk'
  END AS Churn_Risk
FROM bank_churners_1;
## I will use this table to visualize the data##





