-- models/tips_change.sql
{# materialized='incremental' #}
{{
  config(
    materialized='view',
    unique_key='taxi_id_year_month'
)
}}

WITH top_taxis AS (
  SELECT
    taxi_id
  FROM
    {{ ref('top_3_taxis_april_2018') }}
),
monthly_tips AS (
  SELECT
    *
  FROM
    {{ ref('monthly_tips') }}
),
top_taxis_tips AS (
  SELECT
    mt.*
  FROM
    monthly_tips mt
    JOIN top_taxis tt
    ON mt.taxi_id = tt.taxi_id
),
tips_with_lag AS (
  SELECT
    taxi_id,
    year_month,
    tips_sum,
    LAG(tips_sum) OVER (PARTITION BY taxi_id ORDER BY year_month) AS prev_tips_sum
  FROM
    top_taxis_tips
)

SELECT
  taxi_id,
  year_month,
  tips_sum,
  ROUND((tips_sum - prev_tips_sum) / prev_tips_sum * 100, 1) || " %" AS tips_change
FROM
  tips_with_lag
