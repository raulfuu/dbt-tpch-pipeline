{{ config(
    materialized='table'
) }}

with parts as (
    select * from {{ ref('stg_tpch__part') }}
),

final as (
    select
        part_id,
        part_name,
        manufacturer,
        brand,
        part_type,
        part_size,
        container,
        retail_price
    from parts
)

select * from final