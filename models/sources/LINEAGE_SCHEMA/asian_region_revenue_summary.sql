{{ config(materialized='table') }}

SELECT
  NATION,
  TOTAL_REVENUE
FROM {{ ref('regional_sales_summary') }}
WHERE REGION = 'ASIA'
ORDER BY TOTAL_REVENUE DESC
