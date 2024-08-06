-- models/source_chicago_taxi_trips.sql
{{
  config(
    materialized='view'
  )
}}

SELECT
  taxi_id,
  trip_start_timestamp as pickup_datetime,
  tips
FROM
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
