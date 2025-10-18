# US Household Income Exploratory Data Analysis

SELECT *
FROM us_household_income;

SELECT *
FROM us_household_income_statistics;

# Who has the most area of land and the most area of water, per state.
-- Sum or area of water and are of land per state
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
-- Ordering by the third column 
ORDER BY 3 DESC;

# Identify the top 10 largest states by land.
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
-- Ordering by the third column 
ORDER BY 2 DESC
LIMIT 10; 

# Identify top 10 largest states by water.
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
-- Ordering by the third column 
ORDER BY 3 DESC
LIMIT 10; 

# Bringing the tables together
SELECT *
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0;

# Categotical data
SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0;

# By state, what is their avg income and what is their medium income
-- The avg lowest household income, bottom 5.
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
-- Ordering by the mean
ORDER BY 2
LIMIT 5; 

# top 10 highest avg household income. 
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
-- Ordering by the mean
ORDER BY 2 DESC
LIMIT 10; 

# highest median incomes 
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY u.State_Name
-- Ordering by the mean
ORDER BY 3 DESC
LIMIT 10; 

SELECT Type, COUNT(Type), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
WHERE Mean <> 0
GROUP BY Type
-- Might want to filter how the types that have a count that is really low
HAVING COUNT(Type) > 100
ORDER BY 4 DESC; 

# What states have community, shows the states with the lowest household income. 
-- Community is shown to have the lowest median avg salary. 
SELECT *
FROM us_household_income
WHERE Type = 'Community';

# Identified state names and cities where some cities where making a lot of money, suggesting a lot of wealthy people live in that area. 
SELECT u.State_Name, City, ROUND(AVG(Mean), 1) AS Mean, ROUND(AVG(Median), 1) AS Median
FROM us_household_income u
INNER JOIN us_household_income_statistics us
	ON u.id = us.id
GROUP BY U.State_name, City
ORDER BY Mean DESC;



   
    





