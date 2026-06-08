{{ config(
    materialized='table'
) }}

with customers_with_geo as (
    select * from {{ ref('int_customers_with_geo') }}
),

segment_managers as (
    select * from {{ ref('segment_managers') }}
),

final as (
    select
        c.customer_id,
        c.customer_name,
        c.customer_address,
        c.phone_number,
        c.account_balance,
        c.market_segment,
        c.nation_name,
        c.region_name,
        sm.segment_manager,
        sm.profit_target
    from customers_with_geo c
    left join segment_managers sm
        on c.market_segment = sm.market_segment
)

select * from final