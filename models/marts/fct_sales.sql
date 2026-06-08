{{ config(
    materialized='table',
    pre_hook="alter warehouse compute_wh set warehouse_size = 'LARGE'",
    post_hook="alter warehouse compute_wh set warehouse_size = 'XSMALL'"
) }}

with sales_prep as (
    select * from {{ ref('int_sales_prep') }}
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
        sum({{ calc_net_amount('extended_price', 'discount', 'tax') }}) as net_amount_with_tax,
        
        -- Cost and Profitability metrics
        sum(quantity * supply_cost) as total_cost,
        sum({{ calc_net_amount('extended_price', 'discount', 'tax') }}) - sum(quantity * supply_cost) as net_profit,

        -- Audit Metadata
        {{ add_audit_columns() }}
        
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