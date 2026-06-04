{% snapshot scd_part %}

{{
    config(
      target_schema='snapshots',
      unique_key='part_id',
      strategy='check',
      check_cols='all'
    )
}}

select * from {{ ref('stg_tpch__part') }}

{% endsnapshot %}