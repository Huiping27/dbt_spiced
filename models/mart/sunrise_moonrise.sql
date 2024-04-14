-- Define a DBT model to create a new table representing average temperature for weekdays
with forecast_day_data as (
    select sunrise,moonrise 
    from {{ ref('staging_forecast_day') }}
),
add_features as (
    select sunrise,moonrise,
        ,DATE_PART('day', date) as day_of_month -- day of month as a number
        ,TO_CHAR(date, 'Month') as month_of_year -- month name as a text
        ,DATE_PART('year', date) as year -- year as a number
        ,TO_CHAR(date, 'Day') as day_of_week -- weekday name as text
        ,DATE_PART('week', date) as week_of_year -- calender week number as number
        ,TO_CHAR(date, 'IYYY-IW') as year_and_week -- year-calenderweek as text like '2024-43'
    from forecast_day_data
)
select *
from add_features