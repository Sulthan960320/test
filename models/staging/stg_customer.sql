{{ config(materialized='table') }}

WITH tb1 as(
    select
    c_custkey as customer_key, 
    c_name as customer_name, 
    c_nationkey as nation_key    

    from {{source('datafeed_mydata','raw_customer')}})
select * from tb1