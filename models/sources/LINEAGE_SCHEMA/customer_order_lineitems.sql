{{ config(materialized='table') }}

SELECT
  c.C_NAME,
  o.O_ORDERDATE,
  l.L_PARTKEY,
  l.L_QUANTITY,
  l.L_EXTENDEDPRICE
FROM {{ source('tpch_sf1', 'customer') }} c
JOIN {{ source('tpch_sf1', 'orders') }} o
  ON c.C_CUSTKEY = o.O_CUSTKEY
JOIN {{ source('tpch_sf1', 'lineitem') }} l
  ON o.O_ORDERKEY = l.L_ORDERKEY
WHERE o.O_ORDERSTATUS = 'F'
