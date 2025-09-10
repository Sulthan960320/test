{{ config(materialized='table') }}

WITH tb1 as(
    select 
    n_nationkey as nation_key,  
    n_name as customer_nation
    
    from {{source('datafeed_mydata','raw_nation')}})
select * from tb1