-- Define a DBT model to create a new table representing sunrise & moonrise for weekdays
with forecast_day_data as (
    select date, city, moonrise 
    from {{ ref('prep_forecast_day') }}
),
add_features as (
    SELECT 
        date,
        city,
        (CASE WHEN moonrise = 'No moonrise' THEN null ELSE moonrise END)::TIME as moonrise_n
    FROM forecast_day_data
)
select *
from add_features
