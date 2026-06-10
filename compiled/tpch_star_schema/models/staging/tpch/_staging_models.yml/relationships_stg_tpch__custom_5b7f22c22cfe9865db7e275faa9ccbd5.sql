
    
    

with child as (
    select nation_id as from_field
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__customer
    where nation_id is not null
),

parent as (
    select nation_id as to_field
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__nation
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


