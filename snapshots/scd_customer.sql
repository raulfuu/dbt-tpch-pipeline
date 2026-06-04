{% snapshot scd_customer %}

{{
    config(
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ ref('stg_tpch__customer') }}

{% endsnapshot %}