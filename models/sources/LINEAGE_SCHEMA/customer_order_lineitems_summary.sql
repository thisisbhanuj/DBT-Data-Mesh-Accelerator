{{ config(materialized='table') }}

SELECT
  C_NAME,
  COUNT(*) AS total_items,
  SUM(L_EXTENDEDPRICE) AS total_spent
FROM {{ ref('customer_order_lineitems') }}
GROUP BY C_NAME
