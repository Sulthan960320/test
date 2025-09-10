{{ config(materialized='table') }}

select 
    o.order_key,
    o.order_status,
    o.order_total,
    o.order_date,
    o.order_month,
    k.line_quantity,
    c.customer_key,
    c.customer_name,
    n.customer_nation
    
    from {{ ref('stg_orders') }} as o
    
    inner join {{ ref('stg_lineitem') }} k
        on k.order_key = o.order_key 

    inner join {{ ref('stg_customer') }} c 
        on c.customer_key = o.order_key

    inner join {{ ref('stg_nation') }} n 
        on n.nation_key = c.nation_key
