{{ config (materialized='table') }}


with tb1 as (
    select order_key,
    count(1) as my_count
    from {{ref("stg_orders")}}

group by order_key
)
select * from tb1