SELECT
  DATE(pickup_datetime) AS trip_date,
  COUNT(*) AS total_trips,
  ROUND(AVG(fare_amount), 2) AS avg_fare,
  ROUND(AVG(COALESCE(tip_amount, 0)), 2) AS avg_tip,
  ROUND(SUM(fare_amount), 2) AS total_revenue
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2017`
TABLESAMPLE SYSTEM (1 PERCENT)
WHERE fare_amount > 0
GROUP BY trip_date
ORDER BY trip_date DESC
LIMIT 1000;