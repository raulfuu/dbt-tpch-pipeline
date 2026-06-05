{% snapshot scd_part %}

{{
    config(
      target_schema='snapshots',
      unique_key='p_partkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch', 'part') }}

{% endsnapshot %}