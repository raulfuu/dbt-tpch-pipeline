
    
    

with child as (
    select order_id as from_field
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__lineitem
    where order_id is not null
),

parent as (
    select order_id as to_field
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__orders
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


