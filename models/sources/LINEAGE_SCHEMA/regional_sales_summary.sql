{{ config(materialized='table') }}

SELECT
  r.R_NAME AS REGION,
  n.N_NAME AS NATION,
  SUM(l.L_EXTENDEDPRICE * (1 - l.L_DISCOUNT)) AS TOTAL_REVENUE
FROM {{ source('tpch_sf1','region') }} r
JOIN {{ source('tpch_sf1','nation') }} n
  ON r.R_REGIONKEY = n.N_REGIONKEY
JOIN {{ source('tpch_sf1','customer') }} c
  ON n.N_NATIONKEY = c.C_NATIONKEY
JOIN {{ source('tpch_sf1','orders') }} o
  ON c.C_CUSTKEY = o.O_CUSTKEY
JOIN {{ source('tpch_sf1','lineitem') }} l
  ON o.O_ORDERKEY = l.L_ORDERKEY
WHERE r.R_NAME = 'ASIA'
GROUP BY r.R_NAME, n.N_NAME
