{{ config(
    materialized='ephemeral'
) }}

with customers as (
    select * from {{ ref('stg_tpch__customer') }}
),

nations as (
    select * from {{ ref('stg_tpch__nation') }}
),

regions as (
    select * from {{ ref('stg_tpch__region') }}
),

joined as (
    select
        c.customer_id,
        c.customer_name,
        c.customer_address,
        c.phone_number,
        c.account_balance,
        c.market_segment,
        n.nation_name,
        r.region_name
    from customers c
    left join nations n 
        on c.nation_id = n.nation_id
    left join regions r 
        on n.region_id = r.region_id
)

select * from joined