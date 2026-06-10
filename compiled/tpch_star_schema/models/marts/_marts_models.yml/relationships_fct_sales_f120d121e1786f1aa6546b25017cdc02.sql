
    
    

with child as (
    select supplier_id as from_field
    from TPCH_ANALYTICS.PUBLIC.fct_sales
    where supplier_id is not null
),

parent as (
    select supplier_id as to_field
    from TPCH_ANALYTICS.PUBLIC.dim_suppliers
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


