{% snapshot  snap_data_snp %}

{{
    config(
      target_schema='snapshots',
      strategy='timestamp',
      unique_key='id',
      updated_at='updated_at'
   )
}}
select * 
from {{source('datafeed_shared_schema','data_snp_raw')}}

{% endsnapshot %}