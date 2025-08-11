{{ config(materialized='table') }}

-- intentionally duplicate structure for versioning / testing
SELECT
  c.C_NAME,
  o.O_TOTALPRICE,
  o.O_ORDERDATE
FROM {{ source('tpch_sf1', 'customer') }} c
JOIN {{ source('tpch_sf1', 'orders') }} o
  ON c.C_CUSTKEY = o.O_CUSTKEY
WHERE o.O_ORDERSTATUS = 'F'
