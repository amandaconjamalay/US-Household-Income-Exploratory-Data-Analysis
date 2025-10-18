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
## 2. Summarising Land and Water Area by State.
Calculates each state's total land and water area.
* SUM(ALand) and SUM(AWater) aggregate all area values by state.
* **ORDER BY 3 DESC** sorts reults by total water area.
This helps identify which states have the largest water coverage (e.g. Alaska, Michigan).
```
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 3 DESC;
```


