{{ config (materialized='table') }}


with tb1 as (
 select 
    o.customer_key,
    max(o.customer_name) as num, 
    min(o.nation_key) as nation_key_p,
    concat(max(o.customer_name), '+', min(o.nation_key)) as key_q,
    sum(l.order_total) as lanster
    from {{ref('stg_customer')}} as o
    inner join {{ref('stg_orders')}} l
    on l.order_key = o.customer_key
    group by customer_key
)
select * from tb1