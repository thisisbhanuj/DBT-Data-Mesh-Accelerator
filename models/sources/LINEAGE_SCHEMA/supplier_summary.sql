{{ config(materialized='table') }}

SELECT
  S_NAME,
  COUNT(DISTINCT P_NAME) AS unique_parts,
  SUM(L_QUANTITY) AS total_quantity_supplied
FROM {{ ref('supplier_part_distribution') }}
GROUP BY S_NAME
