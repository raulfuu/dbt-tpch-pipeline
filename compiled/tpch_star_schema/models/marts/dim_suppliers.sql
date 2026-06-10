

with  __dbt__cte__int_suppliers_with_geo as (


with suppliers as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__supplier
),

nations as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__nation
),

regions as (
    select * from TPCH_ANALYTICS.PUBLIC.stg_tpch__region
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
), suppliers_with_geo as (
    select * from __dbt__cte__int_suppliers_with_geo
),

final as (
    select
        supplier_id,
        supplier_name,
        supplier_address,
        phone_number,
        account_balance,
        nation_name,
        region_name
    from suppliers_with_geo
)

select * from final