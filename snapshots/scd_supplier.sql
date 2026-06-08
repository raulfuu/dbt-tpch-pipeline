{% snapshot scd_supplier %}

{{
    config(
      unique_key='s_suppkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch', 'supplier') }}

{% endsnapshot %}