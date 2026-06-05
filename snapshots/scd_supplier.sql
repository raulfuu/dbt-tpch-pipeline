{% snapshot scd_supplier %}

{{
    config(
      target_schema='snapshots',
      unique_key='s_suppkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch_sf1', 'supplier') }}

{% endsnapshot %}