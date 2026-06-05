{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

with source as (
    select * from {{ source('tpch', 'orders') }}
    
    {% if is_incremental() %}
    -- Dynamically filter for only new or updated orders
    where o_orderdate >= (select max(order_date) from {{ this }})
    {% endif %}
),

renamed as (
    select
        o_orderkey as order_id,
        o_custkey as customer_id,
        o_orderstatus as order_status,
        o_totalprice as total_price,
        o_orderdate as order_date,
        o_orderpriority as order_priority,
        o_clerk as clerk_name,
        o_shippriority as ship_priority,
        o_comment as comment
    from source
)

select * from renamed