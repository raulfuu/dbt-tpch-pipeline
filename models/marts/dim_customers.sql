{{ config(
    materialized='table'
) }}

with customers_with_geo as (
    select * from {{ ref('int_customers_with_geo') }}
),

final as (
    select
        customer_id,
        customer_name,
        customer_address,
        phone_number,
        account_balance,
        market_segment,
        nation_name,
        region_name
    from customers_with_geo
)

select * from final