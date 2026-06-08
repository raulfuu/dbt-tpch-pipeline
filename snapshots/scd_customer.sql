{% snapshot scd_customer %}

{{
    config(
      unique_key='c_custkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch', 'customer') }}

{% endsnapshot %}