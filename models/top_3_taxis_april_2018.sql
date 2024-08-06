-- models/top_3_taxis_april_2018.sql
{{
  config(
    materialized='view'
  )
}}

WITH monthly_tips AS (
  SELECT
    *
  FROM
    {{ ref('monthly_tips') }}
)

SELECT
  taxi_id,
  tips_sum
FROM
  monthly_tips
WHERE
  year_month = '2018-04'
ORDER BY
  tips_sum DESC
LIMIT 3
