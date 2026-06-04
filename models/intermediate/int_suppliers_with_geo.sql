{{ config(
    materialized='ephemeral'
) }}

with suppliers as (
    select * from {{ ref('stg_tpch__supplier') }}
),

nations as (
    select * from {{ ref('stg_tpch__nation') }}
),

regions as (
    select * from {{ ref('stg_tpch__region') }}
),

joined as (
    select
        s.supplier_id,
        s.supplier_name,
        s.supplier_address,
        s.phone_number,
        s.account_balance,
        n.nation_name,
        r.region_name
    from suppliers s
    left join nations n 
        on s.nation_id = n.nation_id
    left join regions r 
        on n.region_id = r.region_id
)

select * from joined