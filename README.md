# US-Household-Income-Exploratory-Data-Analysis

## Overview
Performing Exploratory Data Analysis on US Household Income data to  identify geographic and demographic income patterns.

## Datasets
* us_household_income
* us_household_income_statistics

## 1. Loading the Data
**us_household_income** contains geographic details such as **State_Name**, **County**, **City**, **ALand**, and **WLand**.
**us_household_income_statistics** includes income measures like **Mean** and **Median**.

```MySQL
SELECT *
FROM us_household_income;

SELECT *
FROM us_household_income_statistics;
```
## 2. Summarising Land and Water Area by State
Calculates each state's total land and water area.
* SUM(ALand) and SUM(AWater) aggregate all area values by state.
* **ORDER BY 3 DESC** sorts reults by total water area.
This helps identify which states have the largest water coverage (e.g. Alaska, Michigan).
```MySQL
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC;
```

## 3. Identifying the Top 10 Largest States by Land
Ranks states by total land area and limits results to the top 10.
The biggest state by land is Texas.
```MySQL
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;
```

## 4. Identifying the Top 10 States by Water Area
This focuses on the total water area, helps to understand which states have extensive lakes or coastal regions (e.g. Michigan) the highest in this data. 
```MySQL
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;
```

## 6. Joining Exploring Income by State
Joined the geopgraphic and statistical data on their shared id column to create a combined dataset.
Calculates each state's average mean and median income, the lists the five states with the lowest incomes.
```MySQL
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
-- Ordering by the mean
ORDER BY 2
LIMIT 5; 
```

## 7. Analysing by Community Type
Groups income by community **Type** to compare household incomes across community categories.
```MySQL
SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY 4 DESC; 
```

## 8. Identifying Wealthy Cities
Finds the cities with the highest average and median household income.
This helps highlight areas with concentrated wealth.
```MySQL
SELECT u.State_Name, City, ROUND(AVG(Mean), 1) AS Mean, ROUND(AVG(Median), 1) AS Median
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
GROUP BY U.State_name, City
ORDER BY Mean DESC;
```

