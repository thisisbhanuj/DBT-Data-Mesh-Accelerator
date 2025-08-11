{{ config(materialized='view') }}

SELECT * FROM {{ source('tpcds_sf10tcl','customer') }}
