-- Define a DBT model to create a new table representing sunrise & moonrise for weekdays
with forecast_day_data as (
    select moonrise 
    from {{ ref('prep_forecast_day') }}
),
add_features as (
    SELECT 
	  (CASE WHEN moonrise = 'No moonrise' THEN null ELSE moonrise END)::TIME moonrise_n
	  ,CAST((CASE WHEN moonrise = 'No moonrise' THEN null ELSE moonrise END)  AS TIME)
    FROM prep_forecast_day
)
select *
from add_features


