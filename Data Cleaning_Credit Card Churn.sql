

## Data Summary
SELECT
  COUNT(*) AS total_customers,
  SUM(CASE 
		WHEN Attrition_Flag = 'Attrited Customer' 
			THEN 1 ELSE 0 END) AS churned_customers,
  ROUND(SUM(CASE 
		WHEN Attrition_Flag = 'Attrited Customer' 
			THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS churn_rate
FROM bank_churners_1;

#Data Cleaning#
select *
from bank_churners;

## Create a copy of the original table to keep the original safe
create table bank_churners_1
like bank_churners;

## Insert data from the original to the copy table
insert bank_churners_1
select *
from bank_churners;

select *
from bank_churners_1;

## Check for Duplicates
select CLIENTNUM, count(*)
from bank_churners_1
group by CLIENTNUM
having count(*) > 1;
## Found No Duplicates

## Check for Null Values
select count(*)
from bank_churners_1
where Naive_Bayes_2 is null;
## Checked and found No Null values in any of the columns

## Check for incorrect or dispersed entries
select distinct Card_Category
from bank_churners_1;
## Checked and found no dispersed value in the columns Attrition_Flag, Gender, Education Marital status, Card category; "Unknown" is accepted as a value.

## Check for Unknown values in the Income column
select count(*) as Income_Unknown
from bank_churners_1
where Income_Category = 'unknown';
## Unknown values in the Income column is around 11%

## Check for Unknown values in the Education column
select count(*) as Education_Unknown
from bank_churners_1
where Education_Level = 'unknown';
## Unknown values in the Education column is around 15%
##I decided to keep the Unknown values and treat as distinct category because the size is not insignificant and may have potential relationship with churn rate

## So, the Data Scrubbing above reveals that dataset is quite clean and can be used for Modelling and Exploratory Analysis

select *
from bank_churners;
