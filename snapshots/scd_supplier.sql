{% snapshot scd_supplier %}

{{
    config(
      target_schema='snapshots',
      unique_key='supplier_id',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ ref('stg_tpch__supplier') }}

{% endsnapshot %}