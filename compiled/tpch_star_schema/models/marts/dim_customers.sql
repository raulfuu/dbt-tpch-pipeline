

with  __dbt__cte__int_customers_with_geo as (


with customers as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__customer
),

nations as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__nation
),

regions as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__region
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
), customers_with_geo as (
    select * from __dbt__cte__int_customers_with_geo
),

segment_managers as (
    select * from TPCH_ANALYTICS.PUBLIC.segment_managers
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