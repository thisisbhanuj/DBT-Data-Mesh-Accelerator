{{ config(materialized='table') }}

SELECT *
FROM {{ ref('high_value_customers') }}
ORDER BY TOTAL_SPENT DESC
LIMIT 5
