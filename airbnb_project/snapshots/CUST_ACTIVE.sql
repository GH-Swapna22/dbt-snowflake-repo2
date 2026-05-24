{{
  config(
    materialized = 'table'
    )
}}

WITH renamed AS (
  SELECT * FROM {{ ref('scd_raw_customer') }}
)
select * from renamed
where DBT_VALID_TO is null