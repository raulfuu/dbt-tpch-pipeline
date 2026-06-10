
    
    

with child as (
    select part_id as from_field
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__partsupp
    where part_id is not null
),

parent as (
    select part_id as to_field
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__part
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


