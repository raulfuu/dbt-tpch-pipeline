{% snapshot scd_customer %}

{{
    config(
      target_schema='snapshots',
      unique_key='c_custkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch_sf1', 'customer') }}

{% endsnapshot %}