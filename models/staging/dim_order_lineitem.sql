{{ config(materialized='table') }}

select 
    o.order_key,
    count(1) as order_unique_items,
    sum(l.line_quantity) as order_total_quantity

     from {{ ref('stg_orders') }} as o

    inner join {{ ref('stg_lineitem') }} l
        on l.order_key = o.order_key 

    group by o.order_key