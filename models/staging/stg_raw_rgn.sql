{{ config (materialized='table')}}

with tb1 as (
    select TRY_CAST(R_REGIONKEY AS INT), R_NAME as region_name,
    R_COMMENT as region_comment
    from {{source('datafeed_mydata','RAW_RGN')}}
    where TRY_CAST(R_REGIONKEY AS INT)<4
)
select * from tb1