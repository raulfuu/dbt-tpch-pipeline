{{ config(
    materialized='ephemeral'
) }}

with lineitem as (
    select * from {{ ref('stg_tpch__lineitem') }}
),

orders as (
    select * from {{ ref('stg_tpch__orders') }}
),

partsupp as (
    select * from {{ ref('stg_tpch__partsupp') }}
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