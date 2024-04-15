-- Define a DBT model to create a new table representing sunrise & moonrise for weekdays
with forecast_day_data as (
          select sunrise, moonrise 
          from {{ ref('staging_forecast_day') }}
      ),
      add_features as (
          select sunrise, moonrise,
              DATE_PART('day', date) as day_of_month,
              TO_CHAR(date, 'Month') as month_of_year,
              DATE_PART('year', date) as year,
              TO_CHAR(date, 'Day') as day_of_week,
              DATE_PART('week', date) as week_of_year,
              TO_CHAR(date, 'IYYY-IW') as year_and_week
          from forecast_day_data
      )
      select *
      from add_features