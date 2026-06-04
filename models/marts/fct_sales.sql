{{ config(
    materialized='table'
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
        
        -- Actual revenue after discounts and taxes
        sum(extended_price * (1 - discount)) as discounted_amount,
        sum(extended_price * (1 - discount) * (1 + tax)) as net_amount_with_tax
        
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