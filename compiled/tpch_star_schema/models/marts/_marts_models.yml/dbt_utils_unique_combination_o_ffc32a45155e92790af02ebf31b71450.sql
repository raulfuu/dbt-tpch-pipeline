





with validation_errors as (

    select
        order_id, part_id, supplier_id
    from TPCH_ANALYTICS.PUBLIC.fct_sales
    group by order_id, part_id, supplier_id
    having count(*) > 1

)

select *
from validation_errors


