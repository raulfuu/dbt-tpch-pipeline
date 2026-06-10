
    
    

with child as (
    select region_id as from_field
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__nation
    where region_id is not null
),

parent as (
    select region_id as to_field
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__region
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


