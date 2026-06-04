{{ config(
    materialized='table'
) }}

with suppliers_with_geo as (
    select * from {{ ref('int_suppliers_with_geo') }}
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