-- This test compares the raw total revenue in staging 
-- against the aggregated total revenue in the fact table.
-- It fails if the totals do not match exactly.

with staging_revenue as (
    select 
        sum(extended_price) as raw_total
    from TPCH_ANALYTICS.PUBLIC.stg_tpch__lineitem
),

fact_revenue as (
    select 
        sum(gross_amount) as model_total
    from TPCH_ANALYTICS.PUBLIC.fct_sales
)

select
    s.raw_total,
    f.model_total
from staging_revenue s
cross join fact_revenue f
where round(s.raw_total, 2) != round(f.model_total, 2)