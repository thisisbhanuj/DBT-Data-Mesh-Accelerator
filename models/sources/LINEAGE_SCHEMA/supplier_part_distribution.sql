{{ config(materialized='table') }}

SELECT
  s.S_NAME,
  p.P_NAME,
  l.L_QUANTITY,
  l.L_EXTENDEDPRICE
FROM {{ source('tpch_sf1','supplier') }} s
JOIN {{ source('tpch_sf1','lineitem') }} l
  ON s.S_SUPPKEY = l.L_SUPPKEY
JOIN {{ source('tpch_sf1','part') }} p
  ON l.L_PARTKEY = p.P_PARTKEY
