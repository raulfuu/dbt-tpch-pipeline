

with  __dbt__cte__int_sales_prep as (


with lineitem as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__lineitem
),

orders as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__orders
),

partsupp as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__partsupp
),

joined as (
    select
        li.order_id,
        li.part_id,
        li.supplier_id,
        li.line_number,
        li.quantity,
        li.extended_price,
        li.discount,
        li.tax,
        li.return_flag,
        li.line_status,
        li.ship_date,
        li.commit_date,
        li.receipt_date,
        li.ship_instructions,
        li.ship_mode,
        o.customer_id,
        o.order_status,
        o.total_price,
        o.order_date,
        o.order_priority,
        o.clerk_name,
        o.ship_priority,
        ps.supply_cost
    from lineitem li
    left join orders o
        on li.order_id = o.order_id
    left join partsupp ps
        on li.part_id = ps.part_id 
        and li.supplier_id = ps.supplier_id
)

select * from joined
), sales_prep as (
    select * from __dbt__cte__int_sales_prep
),

final as (
    select
        -- Foreign Keys to Dimensions
        order_id,
        customer_id,
        part_id,
        supplier_id,

        -- Order level details
        order_date,
        order_status,
        
        -- Aggregations
        count(line_number) as total_line_items,
        sum(quantity) as total_quantity,
        sum(extended_price) as gross_amount,
        
        -- Revenue metrics
        sum(extended_price * (1 - discount)) as discounted_amount,
        sum(
    (extended_price * (1 - discount) * (1 + tax))
) as net_amount_with_tax,
        
        -- Cost and Profitability metrics
        sum(quantity * supply_cost) as total_cost,
        sum(
    (extended_price * (1 - discount) * (1 + tax))
) - sum(quantity * supply_cost) as net_profit,

        -- Audit Metadata
        
    current_timestamp() as _loaded_at,
    'ec4ee78d-ff4b-4ab9-acf4-73ae174f3faf' as _dbt_invocation_id

        
    from sales_prep
    group by 
        order_id,
        customer_id,
        part_id,
        supplier_id,
        order_date,
        order_status
)

select * from final