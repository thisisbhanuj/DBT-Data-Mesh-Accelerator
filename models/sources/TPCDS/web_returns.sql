{{ config(materialized='view') }}

SELECT * FROM {{ source('tpcds_sf10tcl','web_returns') }}
