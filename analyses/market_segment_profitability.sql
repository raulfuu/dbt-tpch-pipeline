with sales as (
    select * from {{ ref('fct_sales') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
),

aggregated as (
    select
        c.market_segment,
        c.segment_manager,
        -- Using MAX just to grab the static target without duplicating it
        max(c.profit_target) as profit_target, 
        sum(s.net_profit) as actual_profit
    from sales s
    join customers c
        on s.customer_id = c.customer_id
    group by 1, 2
)

select
    market_segment,
    segment_manager,
    profit_target,
    actual_profit,
    (actual_profit - profit_target) as profit_variance,
    case
        when actual_profit >= profit_target then 'TARGET MET'
        else 'UNDERPERFORMING'
    end as performance_status
from aggregated
order by actual_profit desc