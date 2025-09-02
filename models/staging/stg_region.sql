{{ config(materialized='table') }}

WITH tb1 as(
    select 
    R_REGIONKEY AS REGIONKEY,
	R_NAME AS NAME,
	R_COMMENT AS COMMENT
    from {{source('datafeed_mydata','raw_region')}})
select * from tb1