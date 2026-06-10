

with parts as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__part
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