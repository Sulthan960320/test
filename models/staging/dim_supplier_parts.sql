{{ config(materialized='table') }}

    select 
    s.suppkey,
    s.name,
    s.nationkey,
    s.acctbal,
    k.suppkey,
    k.partkey,
    k.availqty,
    k.supplycost
    from source {{ref('stg_supplier')}} as s
    inner join {{ref('stg_partsupp')}} k
    on k.suppkey=s.suppkey