select avg_temp_c
,DATE_PART('week', date) AS week
from prep_forecast_day pfd