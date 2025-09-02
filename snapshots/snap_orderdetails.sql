{% snapshot snap_ordersdetails %}

    {{
     config(
      target_schema='snapshots',
     strategy='check',
     unique_key='ORDER_KEY',
     check_cols=['ORDER_STATUS','ORDER_TOTAL','ORDER_DATE','ORDER_MONTH','ORDER_UNIQUE_ITEMS',
                 'ORDER_TOTAL_QUANTITY','CUSTOMER_KEY','CUSTOMER_NAME','CUSTOMER_NATION'],
    )
 }}

select * from {{ ref('dim_orders') }} 

{% endsnapshot %}