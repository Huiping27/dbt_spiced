-- Define a DBT model to create a new table representing sunrise & moonrise for weekdays
with forecast_day_data as (
    select sunrise, moonrise 
    from "climate"."dbt_hli"."staging_forecast_day"
),
add_features as (
    select sunrise, moonrise,
        DATE_PART('day', forecast_date) as day_of_month,
        TO_CHAR(forecast_date, 'Month') as month_of_year,
        DATE_PART('year', forecast_date) as year,
        TO_CHAR(forecast_date, 'Day') as day_of_week,
        DATE_PART('week', forecast_date) as week_of_year,
        TO_CHAR(forecast_date, 'IYYY-IW') as year_and_week
    from forecast_day_data
)
-- Define the output table and columns based on the 'add_features' CTE
select *
from add_features;

