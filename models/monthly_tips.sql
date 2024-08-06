-- models/monthly_tips.sql
{{
  config(
    materialized='view'
  )
}}

WITH filtered_trips AS (
  SELECT
    taxi_id,
    EXTRACT(YEAR FROM pickup_datetime) AS year,
    EXTRACT(MONTH FROM pickup_datetime) AS month,
    tips
  FROM
    {{ ref("source_chicago_taxi_trips") }}
  WHERE
    EXTRACT(YEAR FROM pickup_datetime) = 2018
)

SELECT
  taxi_id,
  FORMAT_TIMESTAMP('%Y-%m', TIMESTAMP(CONCAT(year, '-', month, '-01'))) AS year_month,
  SUM(tips) AS tips_sum
FROM
  filtered_trips
GROUP BY
  taxi_id,
  year_month
