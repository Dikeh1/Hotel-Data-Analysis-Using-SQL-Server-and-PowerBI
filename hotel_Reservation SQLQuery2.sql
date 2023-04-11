/** Questions we answering in the project
-- Is our hotel revenue growing by year: We have two hotels types, so it would be good to segment revenue by hotel types
-- Should we increase our parking lot size?: We want to understand if there is a trend in guests with personal cars
-- What tends can we see n the data? Focus on average daily rate and guests to explore seasonality

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [project].[dbo].['2018$']
union
  select *
  FROM [project].[dbo].['2019$']
union
  select *
  FROM [project].[dbo].['2020$']

 with hotels as (
  SELECT *
  FROM [project].[dbo].['2018$']
union
  select *
  FROM [project].[dbo].['2019$']
union
  select *
  FROM [project].[dbo].['2020$'])

select * 
from hotels


-- We are going to answer the question on revenue generated by year.
-- There are no revenue table, so we improvise

 with hotels as (
  SELECT *
  FROM [project].[dbo].['2018$']
union
  select *
  FROM [project].[dbo].['2019$']
union
  select *
  FROM [project].[dbo].['2020$'])

select arrival_date_year, (stays_in_week_nights + stays_in_weekend_nights)*adr
from hotels


 with hotels as (
  SELECT *
  FROM [project].[dbo].['2018$']
union
  select *
  FROM [project].[dbo].['2019$']
union
  select *
  FROM [project].[dbo].['2020$'])

select arrival_date_year, 
	sum((stays_in_week_nights + stays_in_weekend_nights)*adr) revenue
from hotels
group by arrival_date_year

-- We can see the revenue growth across the year.

-- To see the revenue  generated by hotel type;
 with hotels as (
  SELECT *
  FROM [project].[dbo].['2018$']
union
  select *
  FROM [project].[dbo].['2019$']
union
  select *
  FROM [project].[dbo].['2020$'])

select hotel, arrival_date_year, 
	round(sum((stays_in_week_nights + stays_in_weekend_nights)*adr), 2) revenue
from hotels
group by hotel, arrival_date_year




with hotels as (
  SELECT *
  FROM [project].[dbo].['2018$']
union
  select *
  FROM [project].[dbo].['2019$']
union
  select *
  FROM [project].[dbo].['2020$'])

 SELECT *
 from hotels
 left join [project].[dbo].[market_segment$] on hotels.market_segment = market_segment$.market_segment
 left join [project].[dbo].[meal_cost$] on meal_cost$.meal = hotels.meal