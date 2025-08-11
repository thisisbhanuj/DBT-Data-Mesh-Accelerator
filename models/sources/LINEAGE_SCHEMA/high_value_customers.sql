{{ config(materialized='table') }}

SELECT
  c.C_NAME,
  SUM(o.O_TOTALPRICE) AS TOTAL_SPENT
FROM {{ source('tpch_sf1','customer') }} c
JOIN {{ source('tpch_sf1','orders') }} o
  ON c.C_CUSTKEY = o.O_CUSTKEY
WHERE o.O_ORDERSTATUS = 'F'
GROUP BY c.C_NAME
HAVING SUM(o.O_TOTALPRICE) > 100000
