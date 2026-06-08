{% snapshot scd_part %}

{{
    config(
      unique_key='p_partkey',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ source('tpch', 'part') }}

{% endsnapshot %}