{{ config(materialized='view') }}

SELECT
  t.C_NAME,
  t.TOTAL_SPENT,
  s.total_items
FROM {{ ref('top_5_customers_by_spend') }} t
JOIN {{ ref('customer_order_lineitems_summary') }} s
  ON t.C_NAME = s.C_NAME
